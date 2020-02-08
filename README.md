# Chart_Components

* Animated bar chart for Flutter. Easy to implement and customize.
* Animated calendar grid for Flutter. 

## Demo
![Demo: ](https://github.com/fgcan10/chart_components/raw/master/barchart_calendargrid.gif)

## Usage
To use plugin, just import package `import 'package:chart_components/chart_components.dart';`

## Example
Check de example directory to access the project that implements the image shown above.

````dart
        ........
                    CalendarGrid(
                            year: 2020,
                            month: 1,
                            getColorOfDay: DataRepository.getDayColor,
                            animationDuration: Duration(milliseconds: 1500),
                    ),

        ...........
                    child: BarChart(
                    data: data,
                    labels: labels,
                    dislplayValue: true,
                    reverse: true,
                    getColor: DataRepository.getColor,
                    getIcon: DataRepository.getIcon,
                    barWidth: 42,
                    barSeparation: 12,
                    animationDuration: Duration(milliseconds: 1800),
                    animationCurve: Curves.easeInOutSine,
                    itemRadius: 30,
                    iconHeight: 24,
                    footerHeight: 24,
                    headerValueHeight: 16,
                    roundValuesOnText: false,
                    lineGridColor: Colors.lightBlue,
                    ),
````