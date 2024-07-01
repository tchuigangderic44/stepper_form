import 'package:flutter/material.dart';
import 'package:stepper_form/app/common/utils/helper.dart';
import 'package:stepper_form/app/common/utils/static_values.dart';
import 'package:stepper_form/app/common/widgets/custom_text.dart';

class ProgressForm extends StatefulWidget {
  const ProgressForm({
    required this.pages,
    required this.titles,
    this.activeColor = const Color(0xFF003654),
    this.disableColor = const Color(0xFFB8B8B8),
    this.controller,
    super.key
  });
  final List<Widget> pages;
  final List<ProgressTitle> titles;
  final PFormController? controller;
  final Color activeColor, disableColor;

  @override
  State<ProgressForm> createState() => _ProgressFormState();
}

class _ProgressFormState extends State<ProgressForm> with TickerProviderStateMixin{
  late List<AnimationController> controllers = [];
  late List<Animation<double>> annimations = [];
  late List<Animation<double>> annimationsOpacity = [];
  late List<bool> activeColor = [];

  @override
  void initState() {
    initVariables();
    onInitAnnimation();
    if (widget.controller !=null){
      widget.controller!.addListener(() {
        controlColor(widget.controller!.currentPage);
      });
    }
    super.initState();
  }
  initVariables() {
    int pagesLength = widget.pages.length;
    controllers = List.generate(pagesLength, (index) =>
    AnimationController(vsync: this, duration: const Duration(microseconds: 200), lowerBound: 0)
    );
    annimations = controllers.map((controller) {
      final animation = Tween<double>(begin: 0.1, end: 1).animate(controller);
      return animation; 
    }).toList();
    annimationsOpacity = controllers.map((controller) {
      final animation = Tween<double>(begin: 0, end: 1).animate(controller);
      return animation; 
    }).toList();
    activeColor = List.generate(pagesLength, (index) => false);
  }
  onInitAnnimation() {
    controllers[0].animateTo(1);
    activeColor[0] = true;
  }

  controlColor (int index) {
    for (var i = 0; i < activeColor.length; i++) {
      if ( index == i) {
        if (!annimations[index].isCompleted) {
          controllers[index].animateTo(1);
        }
      } else {
        if (controllers[i].isCompleted) {
          controllers[i].reverse();
        }
      }
      for (var i = 0; i <= index; i++) {
        activeColor[i] = true;
      }
      for (var i = index +1; i < activeColor.length; i++) {
        activeColor[i] = false;
      }
      setState(() {});
    }
  }

  @override
  void dispose() {
    for (var c in controllers) {c.dispose();}
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: widget.pages.map((page) {
          int index = widget.pages.indexOf(page);
          return Stack(
            children: [
              if (index != widget.pages.length - 1)
              Positioned(
                top: 0,
                bottom: 0,
                left: 14.hp,
                width: 4,
                child: SizeTransition(
                  sizeFactor: annimations[index],
                  child: Container(
                    width: 2, 
                    color: activeColor[index + 1]
                    ? widget.activeColor
                    : widget.disableColor,
                  ),
                ),
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Container(
                    width: 30,  
                    height: 30,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: activeColor[index]
                      ? widget.activeColor
                      : widget.disableColor
                    ),
                    child: Center(child: MyText(
                      text: '${index+1}',
                      size: 14.s,
                      fontWeight: FontWeight.bold,
                      color: activeColor[index]
                      ? Colors.white
                      : StaticValues.colors.secondTextColor,
                    ),),
                  ),
                  SizedBox(width: 10.hp,),
                  widget.titles[index].copyWith(
                    textColor: activeColor[index]
                    ? widget.activeColor
                    : StaticValues.colors.secondTextColor
                  )
                ],
              ),
              Padding(
                padding: EdgeInsets.only(left: 40.hp, top: 40.vp),
                child: Row(children: [
                  Expanded(
                    child: FadeTransition(
                      opacity: annimationsOpacity[index],
                      child: SizeTransition(
                        sizeFactor: annimations[index],
                        child: page,
                      ),
                    )
                  )
                ],),
              )
            ],
          );
        }).toList(),
      ),
    );
  }
}

class ProgressTitle extends StatelessWidget {
  const ProgressTitle({
    required this.title,
    this.textColor,
    super.key, 
  });
  final String title;
  final Color? textColor;
  @override
  Widget build(BuildContext context) {
    Color color = textColor??Colors.black; 
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        MyText(
          text: title, 
          size: 16.s, 
          color: color,
          fontWeight: FontWeight.w500
        )
      ],
    );
  }
  copyWith({String? title, Color? textColor}) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        MyText(
          text: title??this.title, 
          size: 16.s, 
          color: textColor??this.textColor,
          fontWeight: FontWeight.w500
        )
      ],
    );
  }
}

class PFormController extends ChangeNotifier {
  PFormController({required this.length});
  int _page = 0;
  final int length;

  nextPage() {
    if (_page < length - 1) _page++;
    notifyListeners();
  }

  get currentPage => _page;

  jumpToPage (int p) {
    _page = p;
    notifyListeners();
  }

  prevPage() {
    if (_page > 0) _page--;
    notifyListeners();
  }
}