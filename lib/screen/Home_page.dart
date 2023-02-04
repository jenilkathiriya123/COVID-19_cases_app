import 'package:flutter/material.dart';
import '../Helper/cowid_api_helper_app.dart';
import '../model/cowid_19_modal_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  dynamic selectedCountry;
  List country = [];
  int? index;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        leading: Container(),
        centerTitle: true,
        elevation: 0,
        backgroundColor: Color(0xff536976),
        title: const Text("Covid 19 Cases"),
      ),
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Color(0xff536976),
              Color(0xffbbd2c5),
            ],
          ),
        ),
        child: FutureBuilder(
          future: CovidApi.covidAPI.fetchCovidDataAPI(),
          builder: (context, snapshot) {
            if (snapshot.hasError) {
              return Center(
                child: Text('Error : ${snapshot.error}'),
              );
            } else if (snapshot.hasData) {
              List<CovidData> data = snapshot.data as List<CovidData>;
              country = data.map((e) => e.countryName).toList();
              return Container(
                alignment: Alignment.topRight,
                padding: const EdgeInsets.all(10),
                child: SingleChildScrollView(
                  physics: const BouncingScrollPhysics(),
                  child: Column(
                    children: [
                      SizedBox(
                        height: 40,
                      ),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          const SizedBox(width: 50),
                          SizedBox(
                            width: MediaQuery.of(context).size.width * 0.70,
                            child: DropdownButtonFormField(
                              focusColor: Colors.black87,
                              iconEnabledColor: Colors.white,
                              hint: const Text(
                                "Please Select Country.",
                                style: TextStyle(color: Colors.white),
                              ),
                              value: selectedCountry,
                              onChanged: (value) {
                                setState(() {
                                  selectedCountry = value;
                                  index = country.indexOf(value);
                                });
                              },
                              items: country.map((e) {
                                return DropdownMenuItem(
                                  value: e,
                                  child: SizedBox(
                                    width: MediaQuery.of(context).size.width *
                                        0.50,
                                    child: Text(e),
                                  ),
                                );
                              }).toList(),
                            ),
                          ),
                          const Spacer(),
                        ],
                      ),
                      (index != null)
                          ? Column(
                              children: [
                                const SizedBox(height: 20),
                                Text(
                                  "Today",
                                  style: TextStyle(
                                      fontSize: 30, color: Colors.white),
                                ),
                                const SizedBox(height: 40),
                                Align(
                                  alignment: Alignment.topLeft,
                                  child: Row(
                                    children: [
                                      Container(
                                        height: 100,
                                        width: 150,
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(10),
                                          color: Colors.white,
                                          boxShadow: const [
                                            BoxShadow(
                                              color: Colors.black,
                                              offset: Offset(
                                                3.0,
                                                3.0,
                                              ),
                                              blurRadius: 7.0,
                                              // spreadRadius: 2.0,
                                            ),
                                          ],
                                        ),
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          children: [
                                            Padding(
                                              padding: const EdgeInsets.only(
                                                  top: 20),
                                              child: Column(
                                                children: [
                                                  Text(
                                                    "ActiveCases",
                                                    style: TextStyle(
                                                        fontSize: 18,
                                                        fontWeight:
                                                            FontWeight.w500),
                                                  ),
                                                  SizedBox(
                                                    height: 10,
                                                  ),
                                                  Text(
                                                    "${data[index!].activeCasesText}",
                                                    style: TextStyle(
                                                        color: Colors.black),
                                                  ),
                                                ],
                                              ),
                                            ),
                                            const SizedBox(height: 5),
                                          ],
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.only(left: 30),
                                        child: Container(
                                          height: 100,
                                          width: 150,
                                          decoration: BoxDecoration(
                                            borderRadius:
                                            BorderRadius.circular(10),
                                            color: Colors.white,
                                            boxShadow: const [
                                              BoxShadow(
                                                color: Colors.black,
                                                offset: Offset(
                                                  3.0,
                                                  3.0,
                                                ),
                                                blurRadius: 7.0,
                                                // spreadRadius: 2.0,
                                              ),
                                            ],
                                          ),
                                          child: Column(
                                            crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                            children: [
                                              Padding(
                                                padding: const EdgeInsets.only(
                                                    top: 20),
                                                child: Column(
                                                  children: [
                                                    Text(
                                                      "Today Deaths",
                                                      style: TextStyle(
                                                          fontSize: 18,
                                                          fontWeight:
                                                          FontWeight.w500),
                                                    ),
                                                    SizedBox(
                                                      height: 10,
                                                    ),
                                                    Text(
                                                      "${data[index!].todayDeaths}",
                                                      style: TextStyle(
                                                          color: Colors.black),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                              const SizedBox(height: 5),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                const SizedBox(height: 50),
                                Text(
                                  "Over All Cases",
                                  style: TextStyle(fontSize: 30,color: Colors.white),
                                ),
                                const SizedBox(height: 50),
                                Align(
                                  alignment: Alignment.topLeft,
                                  child: Row(
                                    children: [
                                      Container(
                                        height: 100,
                                        width: 150,
                                        decoration: BoxDecoration(
                                          borderRadius:
                                          BorderRadius.circular(10),
                                          color: Colors.white,
                                          boxShadow: const [
                                            BoxShadow(
                                              color: Colors.black,
                                              offset: Offset(
                                                3.0,
                                                3.0,
                                              ),
                                              blurRadius: 7.0,
                                              // spreadRadius: 2.0,
                                            ),
                                          ],
                                        ),
                                        child: Column(
                                          crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                          children: [
                                            Padding(
                                              padding: const EdgeInsets.only(
                                                  top: 20),
                                              child: Column(
                                                children: [
                                                  Text(
                                                    "Confirmed",
                                                    style: TextStyle(
                                                        fontSize: 18,
                                                        fontWeight: FontWeight.w500),
                                                  ),
                                                  SizedBox(
                                                    height: 10,
                                                  ),
                                                  Text(
                                                    "${data[index!].totalConfirmed}",
                                                    style: TextStyle(
                                                        color: Colors.black),
                                                  ),
                                                ],
                                              ),
                                            ),
                                            const SizedBox(height: 5),
                                          ],
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.only(left: 30),
                                        child: Container(
                                          height: 100,
                                          width: 150,
                                          decoration: BoxDecoration(
                                            borderRadius:
                                            BorderRadius.circular(10),
                                            color: Colors.white,
                                            boxShadow: const [
                                              BoxShadow(
                                                color: Colors.black,
                                                offset: Offset(
                                                  3.0,
                                                  3.0,
                                                ),
                                                blurRadius: 7.0,
                                                // spreadRadius: 2.0,
                                              ),
                                            ],
                                          ),
                                          child: Column(
                                            crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                            children: [
                                              Padding(
                                                padding: const EdgeInsets.only(
                                                    top: 20),
                                                child: Column(
                                                  children: [
                                                    Text(
                                                      "Deaths",
                                                      style: TextStyle(
                                                          fontSize: 18,
                                                          fontWeight: FontWeight.w500),
                                                    ),
                                                    SizedBox(
                                                      height: 10,
                                                    ),
                                                    Text(
                                                      "${data[index!].totalDeaths}",
                                                      style: TextStyle(
                                                          color: Colors.black),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                              const SizedBox(height: 5),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                const SizedBox(height: 40),
                                Container(
                                  height: 100,
                                  width: 150,
                                  decoration: BoxDecoration(
                                    borderRadius:
                                    BorderRadius.circular(10),
                                    color: Colors.white,
                                    boxShadow: const [
                                      BoxShadow(
                                        color: Colors.black,
                                        offset: Offset(
                                          3.0,
                                          3.0,
                                        ),
                                        blurRadius: 7.0,
                                        // spreadRadius: 2.0,
                                      ),
                                    ],
                                  ),
                                  child: Column(
                                    crossAxisAlignment:
                                    CrossAxisAlignment.center,
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.only(
                                            top: 20),
                                        child: Column(
                                          children: [
                                            Text(
                                              "Recovered",
                                              style: TextStyle(
                                                  fontSize: 18,
                                                  fontWeight: FontWeight.w500),
                                            ),
                                            SizedBox(
                                              height: 10,
                                            ),
                                            Text(
                                              "${data[index!].totalRecovered}",
                                              style: TextStyle(
                                                  color: Colors.black),
                                            ),
                                          ],
                                        ),
                                      ),
                                      const SizedBox(height: 5),
                                    ],
                                  ),
                                )
                              ],
                            )
                          : Column(
                              children: [
                                const SizedBox(height: 160),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      "Plzz Select Country for data...",
                                      style: TextStyle(
                                          color: Colors.white, fontSize: 20),
                                    ),
                                    SizedBox(
                                      width: 10,
                                    ),
                                  ],
                                ),
                              ],
                            ),
                    ],
                  ),
                ),
              );
            } else {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
          },
        ),
      ),
    );
  }
}
