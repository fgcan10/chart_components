# example

Example project for Chart containers.

## Example

### Class to hold the data. Normally it wil come from a DB or API call
````dart
    class DataRepository {
    static List<double> data = [];
    static List<double> _data = [
        2.2,
        0.7, .....
    ];

    static List<double> getData() {
        data = _data;
        return _data;
    }

    static void clearData() {
        data = [];
    }

    static List<String> getLabels() {
        List<String> labels = [
        'tu',
        'we', ....
        ];

        return labels;
    }

    static Color getColor(double value) {
        if (value < 2) {
        return Colors.amber.shade300;
        } else if (value < 4) {
        return Colors.amber.shade600;
        } else
        return Colors.amber.shade900;
    }

    static Color getDayColor(int day) {
        if (day < data.length) {
        return getColor(data[day]);
        } else
        return Colors.indigo.shade50;
    }

    static Icon getIcon(double value) {
        if (value < 1) {
        return Icon(
            Icons.star_border,
            size: 24,
            color: getColor(value),
        );
        } else if (value < 2) {
        return Icon(
            Icons.star_half,
            size: 24,
            color: getColor(value),
        );
        } else
        return Icon(
            Icons.star,
            size: 24,
            color: getColor(value),
        );
    }
    }
````

### Adding the calendar grid

````dart
    CalendarGrid(
                        year: 2020,
                        month: 1,
                        getColorOfDay: DataRepository.getDayColor,
                        animationDuration: Duration(milliseconds: 1500),
                      ),
````

### Adding the bar chart

````dart
    BarChart(
                  data: data,
                  labels: labels,
                  displayValue: true,
                  getColor: DataRepository.getColor,
                  getIcon: DataRepository.getIcon,
                  barWidth: 42,
                  barSeparation: 12,
                  animationDuration: Duration(milliseconds: 1000),
                  itemRadius: 2,
                  iconHeight: 24,
                  footerHeight: 24,
                  headerValueHeight: 16,
                  roundValuesOnText: false,
    )
````   