import 'package:edublock/core/widgets/svg_widget/svg_widget.dart';
import 'package:flutter/material.dart';

class ImageSlider extends StatefulWidget {
  late List<Map<String, String>> imageList = [];
  late PageController controller = PageController();
  late double currentPage = 0.0;
  late Function(int) onPageChanged;

  @override
  _ImageSliderState createState() => _ImageSliderState();

  ImageSlider(
      {super.key,
      required this.imageList,
      required this.controller,
      required this.currentPage,
      required this.onPageChanged});
}

class _ImageSliderState extends State<ImageSlider> {
  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 300),
      child: Stack(
        children: <Widget>[
          PageView.builder(
            controller: widget.controller,
            itemCount: widget.imageList.length,
            itemBuilder: (BuildContext context, int index) {
              return _carouselItem(context, widget.imageList[index]);
            },
            onPageChanged: widget.onPageChanged,
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              margin: const EdgeInsets.only(top: 100.0),
              padding: const EdgeInsets.symmetric(vertical: 20.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: indicator(),
              ),
            ),
          ),
        ],
      ),
    ));
  }

  Widget _carouselItem(BuildContext context, Map<dynamic, dynamic> item) {
    return Column(
      children: [
        Center(
          child: SvgWidget(
              path: item['image'],
              label: item['image'],
              percentage: .5,
              fit: BoxFit.contain),
        ),
        Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(16),
              child: Text(
                item['text_1'],
                textAlign: TextAlign.center,
                style: Theme.of(context)
                    .textTheme
                    .titleLarge
                    ?.copyWith(fontWeight: FontWeight.w800),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16),
              child: Text(
                item['text_2'],
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.titleMedium?.copyWith(
                    fontWeight: FontWeight.w800,
                    height: 1.5,
                    color: const Color(0xFF737A83)),
              ),
            ),
          ],
        )
      ],
    );
  }

  List<Widget> indicator() => List<Widget>.generate(
        widget.imageList.length,
        (index) => AnimatedContainer(
          duration: const Duration(milliseconds: 300),
          margin: widget.currentPage.round() == index ? const EdgeInsets.symmetric(horizontal: 0) : const EdgeInsets.symmetric(horizontal: 2),
          height: 10.0,
          width: widget.currentPage.round() == index ? 30.0 : 10.0,
          decoration: BoxDecoration(
            color: widget.currentPage.round() == index
                ? const Color(0XFFE46232)
                : const Color(0XFF256075).withOpacity(0.2),
            borderRadius: BorderRadius.circular(10.0),
          ),
        ),
      );
}
