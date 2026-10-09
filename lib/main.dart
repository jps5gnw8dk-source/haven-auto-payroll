import 'package:flutter/material.dart';
void main() => runApp(HavenApp());
class HavenApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'HAVEN AUTO PAYROLL',
      debugShowCheckedModeBanner: false,
      home: Dashboard(),
    );
  }
}
class Dashboard extends StatefulWidget {
  @override
  _DashboardState createState() => _DashboardState();
}
class _DashboardState extends State<Dashboard> {
  double revenue = 12500000;
  double totalPercent = 40;
  String status = 'Bado';
  String msg = '';
  void runPayroll(){
    double fixed = 2500000;
    double maxAllowed = revenue * 0.4;
    double salaries = revenue * totalPercent / 100;
    setState(() {
      if(totalPercent > 40){
        status = 'REJECT SALARIES';
        msg = 'Mishahara $totalPercent% > 40% - Imezidi ${totalPercent-40}% - Lipa Fixed $fixed tu! Salaries Hold Escrow!';
      } else if(revenue < fixed){
        status = 'REJECT ALL';
        msg = 'Mapato $revenue < Fixed $fixed - Hayatoshi!';
      } else {
        status = 'PASS Lipa Wote!';
        double profit = revenue - fixed - salaries;
        double fee = revenue * 0.05;
        msg = 'PASS! Rev $revenue Fixed $fixed Sal $salaries (${totalPercent}%) Profit $profit Fee $fee -> Accounting yako auto!';
      }
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('HAVEN AUTO PAYROLL - 40%', style: TextStyle(color: Color(0xFFD4AF37))), backgroundColor: Color(0xFF0A1931)),
      body: ListView(padding: EdgeInsets.all(16), children: [
        Card(child: ListTile(title: Text('Mapato ya Mwezi'), subtitle: Text('$revenue TZS'))),
        Card(color: Color(0xFFFFF3E0), child: ListTile(title: Text('Fixed Costs'), subtitle: Text('Jengo 300k+Umeme 150k+TRA 200k+Server 150k+Msufini+NSSF 20%+WCF 1%+SDL 3.5%+VAT 18% = 2.5M'))),
        Card(color: Color(0xFFE3F2FD), child: ListTile(title: Text('Jumla % Mishahara'), subtitle: Text('$totalPercent% ya $revenue = ${revenue*totalPercent/100} TZS - Max 40% = ${revenue*0.4}'))),
        Slider(value: totalPercent, min: 10, max: 60, divisions: 10, label: '$totalPercent%', onChanged: (v){setState((){totalPercent=v;});}),
        ElevatedButton(style: ElevatedButton.styleFrom(backgroundColor: Colors.green), onPressed: runPayroll, child: Text('RUN PAYROLL - Check 40%', style: TextStyle(color: Colors.white))),
        Card(color: status.contains('PASS')?Color(0xFFE8F5E9):Color(0xFFFFEBEE), child: Padding(padding: EdgeInsets.all(12), child: Column(children: [Text(status, style: TextStyle(fontWeight: FontWeight.bold)), Text(msg)]))),
        Divider(),
        Text('Wafanyakazi % + Direct Pay', style: TextStyle(fontWeight: FontWeight.bold)),
        Card(child: ListTile(title: Text('Price - CEO+Dev 15% - 1,875,000'), subtitle: Text('Bonus 50k + Allowance 50k + OT 2h + NSSF 20% + Direct M-Pesa'))),
        Card(child: ListTile(title: Text('Aisha - Sales 8% - 1,000,000'), subtitle: Text('Commission 5% per Sale + Bonus'))),
        Card(child: ListTile(title: Text('Juma - Ops 6% - 750,000'), subtitle: Text('Allowance 50k + OT 20k/h'))),
        Card(child: ListTile(title: Text('Neema - Care 5% - 625,000'))),
        Card(child: ListTile(title: Text('Baraka - Marketing 4% - 500,000'))),
        Card(child: ListTile(title: Text('Zainab - Accountant 2% - 250,000'))),
        Card(child: ListTile(title: Text('BATCH PAY'), subtitle: Text('Tarehe 28 Saa 10:00 Auto - M-Pesa B2C + CRDB Bulk - Watu 100 Dakika 1 - Service Fee 5% -> Accounting yako'))),
      ]),
    );
  }
}
