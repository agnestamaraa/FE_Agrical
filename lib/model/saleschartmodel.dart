class SalesChart {
  final String tanaman;
  final String date;
  final int volumePenjualan;

  SalesChart({
    required this.tanaman,
    required this.date,
    required this.volumePenjualan,
  });

  factory SalesChart.fromJson(Map<String, dynamic> json) {
    return SalesChart(
      tanaman: json['tanaman'],
      date: json['date'],
      volumePenjualan: json['volumePenjualan'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'tanaman': tanaman,
      'date': date,
      'volumePenjualan': volumePenjualan,
    };
  }
}

class SalesChartList {
  final List<SalesChart> tanaman;

  SalesChartList({
    required this.tanaman,
  });

  factory SalesChartList.fromJson(Map<String, dynamic> json) {
    List<SalesChart> salesCharts = List<SalesChart>.from(
        json['tanaman'].map((model) => SalesChart.fromJson(model)));

    // Sort the list by volumePenjualan in descending order
    salesCharts.sort((a, b) => a.volumePenjualan.compareTo(b.volumePenjualan));
    salesCharts.take(5);
    return SalesChartList(tanaman: salesCharts);
  }

  Map<String, dynamic> toJson() {
    return {
      'tanaman': tanaman.map((SalesChart) => SalesChart.toJson()).toList(),
    };
  }
}
