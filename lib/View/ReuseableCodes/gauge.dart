import 'package:flutter/material.dart';
import 'package:student_progress_indicator_mob/View/ReuseableCodes/textstyling.dart';
import 'package:syncfusion_flutter_gauges/gauges.dart';

class Gauge extends StatefulWidget {
  @override
  final double value;
  final String annotation;
  final Color pointerColor;
  const Gauge({Key key, this.value, this.annotation, this.pointerColor}) : super(key: key);
  _GaugeState createState() => _GaugeState();
}

class _GaugeState extends State<Gauge> {
  @override
  Widget build(BuildContext context) {
      return SfRadialGauge(
          enableLoadingAnimation: true,
          axes:<RadialAxis>[RadialAxis(ranges: <GaugeRange>[
            GaugeRange(
                startValue: 0,
                endValue: widget.value,
                color: widget.pointerColor,
                startWidth: 10,
                endWidth: 10),],
              showLabels: false,
              showTicks: false,
              annotations: <GaugeAnnotation>[
                GaugeAnnotation(
                    angle: 90,
                    axisValue: 5,
                    positionFactor: 0.1,
                    widget: TextS(text:'${widget.value}%',size:2.5,color:widget.pointerColor)
                ),
                GaugeAnnotation(
                    angle: 90,
                    axisValue: 5,
                    positionFactor: 0.3,
                    widget: TextS(text:'${widget.annotation}',
                      size: 2.5,color: widget.pointerColor,)
                )
              ] ),]
      );
  }
}