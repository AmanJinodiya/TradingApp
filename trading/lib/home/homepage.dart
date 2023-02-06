import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/material.dart';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:trading/main.dart';

class homePage extends StatefulWidget {
  const homePage({super.key});

  @override
  State<homePage> createState() => _homePageState();
}

class _homePageState extends State<homePage> {
  late List<ChartSampleData> _chartsData;
  Color? activeButtoncolor = Colors.blue[900];
  bool plain = false;
  late TrackballBehavior _trackballBehavior;
  double topboxheight = 32;
  double topboxwidth = 50;
  bool indicators = true;
  double slider1 = 500050, slider2 = 8;
  String a = "MA", b = "RSI";

  @override
  void initState() {
    // TODO: implement initState

    _chartsData = getsmapledata();
    _trackballBehavior = TrackballBehavior(
        enable: true, activationMode: ActivationMode.singleTap);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    bottomSheet() {
      return showModalBottomSheet(
          context: context,
          isDismissible: false,
          backgroundColor: Colors.black,
          builder: (BuildContext context) {
            return Padding(
              padding: const EdgeInsets.all(20.0),
              child: Container(
                height: size.height * 0.9,
                width: double.infinity,
                decoration: BoxDecoration(),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Indicators",
                          style:
                              TextStyle(fontSize: 20, color: Colors.blue[300]),
                        ),
                        GestureDetector(
                          onTap: () {
                            Navigator.pop(context);
                          },
                          child: const Icon(
                            Icons.clear,
                            color: Colors.white,
                          ),
                        )
                      ],
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Divider(
                      color: Colors.white24,
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Text(
                      "MA",
                      style: TextStyle(fontSize: 20, color: Colors.blue[900]),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    indicatorItem("MA - Moving Average", context),
                    const SizedBox(
                      height: 10,
                    ),
                    indicatorItem("RSI - Relative Stregth Index", context),
                    const SizedBox(
                      height: 10,
                    ),
                    indicatorItem("BOLL - Bollinger Bands", context),
                  ],
                ),
              ),
            );
          });
    }

    void expandBox() {
      setState(() {
        topboxwidth = (plain) ? 100 : 50;
        indicators = !indicators;
        if (plain) {
          a = "Ascending Angle";
          b = "High exposure";
        } else {
          a = "MA";
          b = "RSI";
        }
      });
    }

    return Scaffold(
      appBar: AppBar(
          backgroundColor: Colors.black,
          leading: const Icon(
            Icons.arrow_back_ios_rounded,
            color: Colors.white,
          ),
          title: const Text(
            "Polygon",
            style: TextStyle(color: Colors.white),
          ),
          actions: const [
            Padding(
              padding: EdgeInsets.only(right: 20.0),
              child: Icon(
                Icons.bookmark_border,
                color: Colors.white,
              ),
            )
          ]),
      backgroundColor: Colors.grey[900],
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                width: double.infinity,
                height: size.height * 0.1,
                decoration: const BoxDecoration(
                    color: Colors.black,
                    borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(20),
                        bottomRight: Radius.circular(20))),
                child: Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: ListTile(
                      leading: const Icon(
                        Icons.deblur,
                        color: Colors.purple,
                        size: 40,
                      ),
                      title: const Text(
                        "\u{20B9}94.634",
                        style: TextStyle(color: Colors.white),
                      ),
                      subtitle: Text(
                        "MATIC",
                        style: TextStyle(color: Colors.blue[900]),
                      ),
                      trailing: ElevatedButton(
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.white70),
                        child: Text(
                          "Discuss  >>",
                          style:
                              TextStyle(fontSize: 15, color: Colors.grey[800]),
                        ),
                      ),
                    )),
              ),
              Padding(
                padding: const EdgeInsets.only(right: 12.0, top: 14),
                child: Stack(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(
                        left: 12.0,
                      ),
                      child: Row(
                        children: [
                          Container(
                            width: size.width * 0.2,
                            height: size.height * 0.04,
                            decoration: const BoxDecoration(
                                color: Colors.black,
                                borderRadius:
                                    BorderRadius.all(Radius.circular(8))),
                            child: const Padding(
                              padding: EdgeInsets.symmetric(horizontal: 8.0),
                              child: Center(
                                  child: Text(
                                "2.79%",
                                style: TextStyle(color: Colors.green),
                              )),
                            ),
                          ),
                          const SizedBox(
                            width: 8,
                          ),
                          AnimatedContainer(
                            duration: Duration(milliseconds: 800),
                            width: topboxwidth,
                            height: topboxheight,
                            decoration: const BoxDecoration(
                                color: Colors.white12,
                                borderRadius:
                                    BorderRadius.all(Radius.circular(8))),
                            child: Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 8.0),
                              child: Center(
                                  child: Text(
                                a,
                                style: TextStyle(color: Colors.blue[200]),
                              )),
                            ),
                          ),
                          const SizedBox(
                            width: 8,
                          ),
                          AnimatedContainer(
                            duration: Duration(milliseconds: 800),
                            width: topboxwidth,
                            height: topboxheight,
                            decoration: const BoxDecoration(
                                color: Colors.white12,
                                borderRadius:
                                    BorderRadius.all(Radius.circular(8))),
                            child: Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 8.0),
                              child: Center(
                                  child: Text(
                                b,
                                style: TextStyle(color: Colors.blue[200]),
                              )),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                        height: size.height * 0.4,
                        width: double.infinity,
                        child: (plain)
                            ? SfCartesianChart(
                                borderWidth: 0,
                                plotAreaBorderWidth: 0,
                                trackballBehavior: _trackballBehavior,
                                series: <LineSeries<ChartSampleData, DateTime>>[
                                  LineSeries<ChartSampleData, DateTime>(
                                      dataSource: _chartsData,
                                      xValueMapper:
                                          (ChartSampleData sales, _) => sales.x,
                                      yValueMapper:
                                          (ChartSampleData sales, _) =>
                                              sales.open)
                                ],
                                primaryXAxis: DateTimeAxis(
                                    borderWidth: 0,
                                    axisLine: AxisLine(width: 0),
                                    majorGridLines:
                                        MajorGridLines(color: Colors.white12)),
                                primaryYAxis: NumericAxis(
                                    minimum: 85,
                                    maximum: 120,
                                    interval: 8,
                                    axisLine: AxisLine(width: 0),
                                    majorGridLines:
                                        MajorGridLines(color: Colors.white12)),
                              )
                            : SfCartesianChart(
                                trackballBehavior: _trackballBehavior,
                                plotAreaBorderWidth: 0,
                                series: <CandleSeries>[
                                  CandleSeries<ChartSampleData, DateTime>(
                                      dataSource: _chartsData,
                                      xValueMapper:
                                          (ChartSampleData sales, _) => sales.x,
                                      lowValueMapper:
                                          (ChartSampleData sales, _) =>
                                              sales.low,
                                      highValueMapper:
                                          (ChartSampleData sales, _) =>
                                              sales.high,
                                      openValueMapper:
                                          (ChartSampleData sales, _) =>
                                              sales.open,
                                      closeValueMapper:
                                          (ChartSampleData sales, _) =>
                                              sales.close)
                                ],
                                primaryXAxis: DateTimeAxis(
                                    axisLine: AxisLine(width: 0),
                                    majorGridLines:
                                        MajorGridLines(color: Colors.white12)),
                                primaryYAxis: NumericAxis(
                                    minimum: 85,
                                    maximum: 120,
                                    interval: 8,
                                    axisLine: AxisLine(width: 0),
                                    majorGridLines:
                                        MajorGridLines(color: Colors.white12)),
                              )),
                  ],
                ),
                // sgf
              ),
              (indicators)
                  ? GestureDetector(
                      onTap: bottomSheet,
                      child: Padding(
                        padding: const EdgeInsets.only(right: 8.0),
                        child: Align(
                            alignment: Alignment.bottomRight,
                            child: Container(
                              width: size.width * 0.3,
                              height: 40,
                              decoration: const BoxDecoration(
                                  color: Colors.black,
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(10))),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: const [
                                  Icon(
                                    Icons.graphic_eq_rounded,
                                    color: Colors.white,
                                    size: 20,
                                  ),
                                  Text(
                                    "Indicators",
                                    style: TextStyle(color: Colors.white),
                                  )
                                ],
                              ),
                            )),
                      ),
                    )
                  : Container(),
              Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 12.0, horizontal: 4),
                child: Container(
                  height: size.height * 0.06,
                  width: double.infinity,
                  decoration: BoxDecoration(
                      color: Colors.grey[900],
                      borderRadius:
                          const BorderRadius.all(Radius.circular(10))),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        width: size.width * 0.81,
                        decoration: const BoxDecoration(
                            color: Colors.black54,
                            borderRadius:
                                const BorderRadius.all(Radius.circular(10))),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              SizedBox(
                                width: 50,
                                height: 30,
                                child: ElevatedButton(
                                  onPressed: (() {}),
                                  style: ButtonStyle(),
                                  child: const Text(
                                    "1H",
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 8),
                                  ),
                                ),
                              ),
                              SizedBox(
                                width: 50,
                                height: 30,
                                child: ElevatedButton(
                                  onPressed: (() {}),
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: Colors.white12,
                                  ),
                                  child: const Text(
                                    "1D",
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 8),
                                  ),
                                ),
                              ),
                              SizedBox(
                                width: 50,
                                height: 30,
                                child: ElevatedButton(
                                  onPressed: (() {}),
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: Colors.white12,
                                  ),
                                  child: const Text(
                                    "1W",
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 8),
                                  ),
                                ),
                              ),
                              SizedBox(
                                width: 50,
                                height: 30,
                                child: ElevatedButton(
                                  onPressed: (() {}),
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: Colors.white12,
                                  ),
                                  child: const Text(
                                    "1M",
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 8),
                                  ),
                                ),
                              ),
                              SizedBox(
                                width: 50,
                                height: 30,
                                child: ElevatedButton(
                                  onPressed: (() {}),
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: Colors.white12,
                                  ),
                                  child: const Text(
                                    "5Y",
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 8),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            plain = !plain;
                            expandBox();
                          });
                        },
                        child: Container(
                          height: size.height * 0.05,
                          decoration: const BoxDecoration(
                              color: Colors.black54,
                              borderRadius:
                                  BorderRadius.all(Radius.circular(8))),
                          child: Center(
                            child: Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 12.0),
                              child: Icon(
                                (plain)
                                    ? Icons.bar_chart_rounded
                                    : Icons.auto_graph_outlined,
                                color: Colors.green,
                                size: 35,
                              ),
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.only(left: 12.0, right: 12.0, top: 12.0),
                child: Container(
                  height: size.height * 0.288,
                  width: double.infinity,
                  decoration: const BoxDecoration(
                    color: Colors.black54,
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(30.0),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: const [
                            Text(
                              "Analyst Ratings",
                              style:
                                  TextStyle(color: Colors.white, fontSize: 18),
                            ),
                            Icon(
                              Icons.star,
                              color: Colors.green,
                            )
                          ],
                        ),
                        const SizedBox(
                          height: 30,
                        ),
                        Row(
                          children: [
                            Container(
                              width: size.width * 0.25,
                              height: 50,
                              decoration: BoxDecoration(
                                  color: Colors.black,
                                  border: Border.all(color: Colors.white30),
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(10))),
                              child: const Center(
                                child: Text(
                                  '\u{20B9}0.94634',
                                  style: TextStyle(color: Colors.white),
                                ),
                              ),
                            ),
                            Container(
                              width: size.width * 0.5,
                              height: 50,
                              decoration: BoxDecoration(
                                  color: Colors.black,
                                  border: Border.all(color: Colors.white12),
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(10))),
                              child: const Center(
                                child: Text(
                                  'TargetPrice',
                                  style: TextStyle(color: Colors.white24),
                                ),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 30,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: const [
                            Text(
                              "Strong\n Buy",
                              style: TextStyle(color: Colors.white),
                            ),
                            Text(
                              "Buy",
                              style: TextStyle(color: Colors.white),
                            ),
                            Text(
                              "Hold",
                              style: TextStyle(color: Colors.white),
                            ),
                            Text(
                              "Sell",
                              style: TextStyle(color: Colors.white),
                            ),
                            Text(
                              "Strong\n Sell",
                              style: TextStyle(color: Colors.white),
                            ),
                          ],
                        ),
                        const Center(
                          child: Icon(
                            Icons.keyboard_arrow_down_outlined,
                            color: Colors.grey,
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    height: 10,
                    width: size.width * 0.3,
                    decoration: const BoxDecoration(
                        color: Colors.green,
                        borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(10),
                            bottomRight: Radius.circular(10))),
                    child: Text(""),
                  )
                ],
              ),
              Padding(
                padding:
                    const EdgeInsets.only(left: 12.0, right: 12.0, top: 12.0),
                child: Container(
                  height: size.height * 0.23,
                  width: double.infinity,
                  decoration: const BoxDecoration(
                    color: Colors.black54,
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(30.0),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Your Porfolio Exposure",
                              style: TextStyle(
                                  color: Colors.amber[600], fontSize: 17),
                            ),
                            const Text(
                              '\u{20B9}14,69,073',
                              style:
                                  TextStyle(color: Colors.white, fontSize: 18),
                            )
                          ],
                        ),
                        const SizedBox(
                          height: 12,
                        ),
                        Divider(
                          color: Colors.grey[800],
                        ),
                        const SizedBox(
                          height: 12,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              children: const [
                                Text(
                                  "INVESTED",
                                  style: TextStyle(color: Colors.white38),
                                ),
                                SizedBox(
                                  height: 8,
                                ),
                                Text(
                                  "\u{20B9}6480",
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 20),
                                )
                              ],
                            ),
                            Column(
                              children: const [
                                Text(
                                  "QUANTITY",
                                  style: TextStyle(color: Colors.white38),
                                ),
                                SizedBox(
                                  height: 8,
                                ),
                                Text(
                                  "1.5",
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 20),
                                )
                              ],
                            ),
                            Column(
                              children: const [
                                Text(
                                  "Broker",
                                  style: TextStyle(color: Colors.white38),
                                ),
                                SizedBox(
                                  height: 8,
                                ),
                                Icon(
                                  Icons.diamond,
                                  color: Colors.white,
                                  size: 30,
                                )
                              ],
                            ),
                          ],
                        ),
                        const Center(
                          child: Icon(
                            Icons.keyboard_arrow_down_outlined,
                            color: Colors.grey,
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    height: 10,
                    width: size.width * 0.3,
                    decoration: BoxDecoration(
                        color: Colors.amber[700],
                        borderRadius: const BorderRadius.only(
                            bottomLeft: Radius.circular(10),
                            bottomRight: Radius.circular(10))),
                    child: Text(""),
                  )
                ],
              ),
              const SizedBox(
                height: 30,
              ),
              Center(
                child: Container(
                  height: 40,
                  width: 250,
                  decoration: BoxDecoration(
                      color: Colors.grey[850],
                      borderRadius: const BorderRadius.only(
                          topLeft: Radius.circular(15),
                          topRight: Radius.circular(15))),
                  child: const Center(
                    child: Text(
                      "HISTORICAL YIELD",
                      style: TextStyle(color: Colors.white, fontSize: 17),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 10, right: 12),
                child: Container(
                  height: size.height * 0.46,
                  width: double.infinity,
                  decoration: BoxDecoration(color: Colors.black),
                  child: Padding(
                    padding: const EdgeInsets.all(30.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        const Text(
                          "If You Would have Invested",
                          style: TextStyle(color: Colors.white54),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Text(
                              "\u{20B9}1000000",
                              style:
                                  TextStyle(color: Colors.white, fontSize: 20),
                            ),
                            Slider(
                              min: 0,
                              max: 100000000,
                              value: slider1,
                              onChanged: ((value) {
                                setState(() {
                                  slider1 = value;
                                });
                              }),
                            )
                          ],
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        const Text(
                          "For Previous",
                          style: TextStyle(color: Colors.white54),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Text(
                              "1 Year",
                              style:
                                  TextStyle(color: Colors.white, fontSize: 20),
                            ),
                            Slider(
                              min: 0,
                              max: 100,
                              value: slider2,
                              onChanged: ((value) {
                                setState(() {
                                  slider2 = value;
                                });
                              }),
                            )
                          ],
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        const Text(
                          "You Would Have",
                          style: TextStyle(color: Colors.white54),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            const Text(
                              "\u{20B9}1120.18 ",
                              style:
                                  TextStyle(color: Colors.white, fontSize: 25),
                            ),
                            Text(
                              "1205.67 MATIC",
                              style: TextStyle(
                                  color: Colors.blue[900], fontSize: 16),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            ElevatedButton(
                                onPressed: () {},
                                child: Row(
                                  children: const [
                                    Icon(Icons.track_changes),
                                    Text(
                                      " MATIC",
                                      style: TextStyle(color: Colors.white),
                                    )
                                  ],
                                )),
                            ElevatedButton(
                                onPressed: () {},
                                style: ElevatedButton.styleFrom(
                                    backgroundColor: Colors.white12),
                                child: Row(
                                  children: const [
                                    Icon(Icons.track_changes),
                                    Text(
                                      " BTC",
                                      style: TextStyle(color: Colors.white),
                                    )
                                  ],
                                )),
                            ElevatedButton(
                                onPressed: () {},
                                style: ElevatedButton.styleFrom(
                                    backgroundColor: Colors.white12),
                                child: Row(
                                  children: const [
                                    Icon(Icons.track_changes),
                                    Text(
                                      " ETH",
                                      style: TextStyle(color: Colors.white),
                                    )
                                  ],
                                )),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Container(
                color: Colors.black,
                child: Padding(
                  padding: const EdgeInsets.all(30.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "About MATIC",
                        style: TextStyle(color: Colors.blue[900], fontSize: 22),
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: const [
                          Text(
                            "Market Cap",
                            style:
                                TextStyle(color: Colors.white38, fontSize: 17),
                          ),
                          Text(
                            "\u{20B9}65,195 Cr. ",
                            style: TextStyle(color: Colors.white, fontSize: 17),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      const Divider(
                        color: Colors.white24,
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text(
                            "Revenue",
                            style:
                                TextStyle(color: Colors.white38, fontSize: 17),
                          ),
                          Row(
                            children: [
                              loss("50.2"),
                              const SizedBox(
                                width: 5,
                              ),
                              const Text(
                                "\u{20B9}789,11,2.84 Cr. ",
                                style: TextStyle(
                                    color: Colors.white, fontSize: 17),
                              ),
                            ],
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      const Divider(
                        color: Colors.white24,
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: const [
                          Text(
                            "P/E Ration",
                            style:
                                TextStyle(color: Colors.white38, fontSize: 17),
                          ),
                          Text(
                            "30.2 ",
                            style: TextStyle(color: Colors.white, fontSize: 17),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      const Divider(
                        color: Colors.white24,
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text(
                            "Profit",
                            style:
                                TextStyle(color: Colors.white38, fontSize: 17),
                          ),
                          Row(
                            children: [
                              loss("80.2"),
                              const SizedBox(
                                width: 5,
                              ),
                              const Text(
                                "\u{20B9}1098.48 Cr. ",
                                style: TextStyle(
                                    color: Colors.white, fontSize: 17),
                              ),
                            ],
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      const Divider(
                        color: Colors.white24,
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: const [
                          Text(
                            "Market Cap",
                            style:
                                TextStyle(color: Colors.white38, fontSize: 17),
                          ),
                          Text(
                            "1.92 ",
                            style: TextStyle(color: Colors.white, fontSize: 17),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      const Divider(
                        color: Colors.white24,
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                      Text(
                        "Technical Indicators",
                        style: TextStyle(color: Colors.blue[900], fontSize: 22),
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                      detailList("Cumulative Market Sentinment", "62.42",
                          "This measures the sentiment of the investors for that particular stock or boin based on all the news articles,bloge,reserch papers,financial content featuring it."),
                      const SizedBox(
                        height: 15,
                      ),
                      detailList("Relative Strength Index (RSI)", "37.88",
                          "This measures the sentiment of the investors for that particular stock or boin based on all the news articles,bloge,reserch papers,financial content featuring it."),
                      const SizedBox(
                        height: 15,
                      ),
                      detailList("Volatility", "0.54",
                          "This measures the sentiment of the investors for that particular stock or boin based on all the news articles,bloge,reserch papers,financial content featuring it."),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  List<ChartSampleData> getsmapledata() {
    return [
      ChartSampleData(
          x: DateTime(2016, 12, 05),
          open: 110,
          high: 114.7,
          low: 108.25,
          close: 113.95),
      ChartSampleData(
          x: DateTime(2016, 01, 11),
          open: 98.97,
          high: 101.19,
          low: 95.36,
          close: 97.13),
      ChartSampleData(
          x: DateTime(2016, 01, 18),
          open: 98.41,
          high: 101.46,
          low: 93.42,
          close: 101.42),
      ChartSampleData(
          x: DateTime(2016, 01, 25),
          open: 101.52,
          high: 101.53,
          low: 92.39,
          close: 97.34),
      ChartSampleData(
          x: DateTime(2016, 02, 01),
          open: 96.47,
          high: 97.33,
          low: 93.69,
          close: 94.02),
      ChartSampleData(
          x: DateTime(2016, 02, 08),
          open: 93.13,
          high: 96.35,
          low: 92.59,
          close: 93.99),
      ChartSampleData(
          x: DateTime(2016, 02, 15),
          open: 91.02,
          high: 94.89,
          low: 90.61,
          close: 92.04),
      ChartSampleData(
          x: DateTime(2016, 02, 22),
          open: 96.31,
          high: 98.0237,
          low: 98.0237,
          close: 96.31),
      ChartSampleData(
          x: DateTime(2016, 02, 29),
          open: 99.86,
          high: 106.75,
          low: 99.65,
          close: 106.01),
      ChartSampleData(
          x: DateTime(2016, 03, 07),
          open: 102.39,
          high: 102.83,
          low: 100.15,
          close: 102.26),
      ChartSampleData(
          x: DateTime(2016, 03, 14),
          open: 101.91,
          high: 106.5,
          low: 101.78,
          close: 105.92),
      ChartSampleData(
          x: DateTime(2016, 03, 21),
          open: 105.93,
          high: 107.65,
          low: 104.89,
          close: 105.67),
      ChartSampleData(
          x: DateTime(2016, 03, 28),
          open: 106,
          high: 110.42,
          low: 104.88,
          close: 109.99),
      ChartSampleData(
          x: DateTime(2016, 04, 04),
          open: 110.42,
          high: 112.19,
          low: 108.121,
          close: 108.66),
      ChartSampleData(
          x: DateTime(2016, 04, 11),
          open: 108.97,
          high: 112.39,
          low: 108.66,
          close: 109.85),
      ChartSampleData(
          x: DateTime(2016, 04, 18),
          open: 108.89,
          high: 108.95,
          low: 104.62,
          close: 105.68),
      ChartSampleData(
          x: DateTime(2016, 04, 25),
          open: 105,
          high: 105.65,
          low: 92.51,
          close: 93.74),
      ChartSampleData(
          x: DateTime(2016, 05, 02),
          open: 93.965,
          high: 95.9,
          low: 91.85,
          close: 92.72),
      ChartSampleData(
          x: DateTime(2016, 05, 09),
          open: 93,
          high: 93.77,
          low: 89.47,
          close: 90.52),
      ChartSampleData(
          x: DateTime(2016, 05, 16),
          open: 92.39,
          high: 95.43,
          low: 91.65,
          close: 95.22),
      ChartSampleData(
          x: DateTime(2016, 05, 23),
          open: 95.87,
          high: 100.73,
          low: 95.67,
          close: 100.35),
      ChartSampleData(
          x: DateTime(2016, 05, 30),
          open: 99.6,
          high: 100.4,
          low: 96.63,
          close: 97.92),
      ChartSampleData(
          x: DateTime(2016, 06, 06),
          open: 97.99,
          high: 101.89,
          low: 97.55,
          close: 98.83),
      ChartSampleData(
          x: DateTime(2016, 06, 13),
          open: 98.69,
          high: 99.12,
          low: 95.3,
          close: 95.33),
      ChartSampleData(
          x: DateTime(2016, 06, 20),
          open: 96,
          high: 96.89,
          low: 92.65,
          close: 93.4),
      ChartSampleData(
          x: DateTime(2016, 06, 27),
          open: 93,
          high: 96.465,
          low: 91.5,
          close: 95.89),
      ChartSampleData(
          x: DateTime(2016, 07, 04),
          open: 95.39,
          high: 96.89,
          low: 94.37,
          close: 96.68),
      ChartSampleData(
          x: DateTime(2016, 07, 11),
          open: 96.75,
          high: 99.3,
          low: 96.73,
          close: 98.78),
      ChartSampleData(
          x: DateTime(2016, 07, 18),
          open: 98.7,
          high: 101,
          low: 98.31,
          close: 98.66),
      ChartSampleData(
          x: DateTime(2016, 07, 25),
          open: 98.25,
          high: 104.55,
          low: 96.42,
          close: 104.21),
      ChartSampleData(
          x: DateTime(2016, 08, 01),
          open: 104.41,
          high: 107.65,
          low: 104,
          close: 107.48),
      ChartSampleData(
          x: DateTime(2016, 08, 08),
          open: 107.52,
          high: 108.94,
          low: 107.16,
          close: 108.18),
      ChartSampleData(
          x: DateTime(2016, 08, 15),
          open: 108.14,
          high: 110.23,
          low: 108.08,
          close: 109.36),
      ChartSampleData(
          x: DateTime(2016, 08, 22),
          open: 108.86,
          high: 109.32,
          low: 106.31,
          close: 106.94),
      ChartSampleData(
          x: DateTime(2016, 08, 29),
          open: 106.62,
          high: 108,
          low: 105.5,
          close: 107.73),
      ChartSampleData(
          x: DateTime(2016, 09, 05),
          open: 107.9,
          high: 108.76,
          low: 103.13,
          close: 103.13),
      ChartSampleData(
          x: DateTime(2016, 09, 12),
          open: 102.65,
          high: 116.13,
          low: 102.53,
          close: 114.92),
      ChartSampleData(
          x: DateTime(2016, 09, 19),
          open: 115.19,
          high: 116.18,
          low: 111.55,
          close: 112.71),
      ChartSampleData(
          x: DateTime(2016, 09, 26),
          open: 111.64,
          high: 114.64,
          low: 111.55,
          close: 113.05),
      ChartSampleData(
          x: DateTime(2016, 10, 03),
          open: 112.71,
          high: 114.56,
          low: 112.28,
          close: 114.06),
      ChartSampleData(
          x: DateTime(2016, 10, 10),
          open: 115.02,
          high: 118.69,
          low: 114.72,
          close: 117.63),
      ChartSampleData(
          x: DateTime(2016, 10, 17),
          open: 117.33,
          high: 118.21,
          low: 113.8,
          close: 116.6),
      ChartSampleData(
          x: DateTime(2016, 10, 24),
          open: 117.1,
          high: 118.36,
          low: 113.31,
          close: 113.72),
      ChartSampleData(
          x: DateTime(2016, 10, 31),
          open: 113.65,
          high: 114.23,
          low: 108.11,
          close: 108.84),
      ChartSampleData(
          x: DateTime(2016, 11, 07),
          open: 110.08,
          high: 111.72,
          low: 105.83,
          close: 108.43),
      ChartSampleData(
          x: DateTime(2016, 11, 14),
          open: 107.71,
          high: 110.54,
          low: 104.08,
          close: 110.06),
      ChartSampleData(
          x: DateTime(2016, 11, 21),
          open: 114.12,
          high: 115.42,
          low: 115.42,
          close: 114.12),
      ChartSampleData(
          x: DateTime(2016, 11, 28),
          open: 111.43,
          high: 112.465,
          low: 108.85,
          close: 109.9),
      ChartSampleData(
          x: DateTime(2016, 12, 05),
          open: 110,
          high: 114.7,
          low: 108.25,
          close: 113.95),
      ChartSampleData(
          x: DateTime(2016, 12, 12),
          open: 113.29,
          high: 116.73,
          low: 112.49,
          close: 115.97),
      ChartSampleData(
          x: DateTime(2016, 12, 19),
          open: 115.8,
          high: 117.5,
          low: 115.59,
          close: 116.52),
      ChartSampleData(
          x: DateTime(2016, 12, 26),
          open: 116.52,
          high: 118.0166,
          low: 115.43,
          close: 115.82),
    ];
  }

  bool value = false, expand = false;
  Widget indicatorItem(x, context) => Column(
        children: [
          Row(
            children: [
              Checkbox(
                fillColor: MaterialStateProperty.all(Colors.white12),
                value: this.value,
                onChanged: (valu) {
                  setState(() {
                    value = !value;
                  });
                },
              ),
              Container(
                height: 50,
                width: MediaQuery.of(context).size.width * 0.7,
                decoration: BoxDecoration(
                    color: Colors.grey[900],
                    border: Border.all(color: Colors.white10)),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        x,
                        style: const TextStyle(
                          color: Colors.white,
                        ),
                      ),
                      GestureDetector(
                        onTap: (() {
                          setState(() {
                            expand = !expand;
                          });
                        }),
                        child: const Icon(
                          Icons.keyboard_arrow_up_outlined,
                          color: Colors.white30,
                        ),
                      )
                    ],
                  ),
                ),
              )
            ],
          ),
          (expand)
              ? Row(
                  children: [
                    const SizedBox(
                      width: 40,
                    ),
                    item("10 day"),
                    item("30 day")
                  ],
                )
              : Container()
        ],
      );
}

Widget item(x) => Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Checkbox(
            value: false,
            fillColor: MaterialStateProperty.all(Colors.white12),
            onChanged: (value) {
              value != value;
            }),
        const SizedBox(
          width: 10,
        ),
        Text(
          x,
          style: TextStyle(color: Colors.white),
        )
      ],
    );

Widget loss(amount) => Container(
    decoration: BoxDecoration(color: Colors.grey[850]),
    child: Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: Text(
        "-${amount}%",
        style: TextStyle(color: Colors.red),
      ),
    ));

Widget detailList(a, b, c) => Container(
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                a,
                style: const TextStyle(color: Colors.white, fontSize: 16),
              ),
              Text(
                b,
                style: const TextStyle(color: Colors.green, fontSize: 18),
              )
            ],
          ),
          const SizedBox(
            height: 10,
          ),
          Text(
            c,
            style: const TextStyle(color: Colors.white38, fontSize: 13),
          )
        ],
      ),
    );

class ChartSampleData {
  ChartSampleData({this.x, this.open, this.close, this.low, this.high});
  final DateTime? x;
  final num? open;
  final num? close;
  final num? low;
  final num? high;
}
