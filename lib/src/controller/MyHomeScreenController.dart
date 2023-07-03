import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MyHomeScreenController extends GetxController with GetSingleTickerProviderStateMixin{

  ///MM1
  var averageInterarrivaltimeController;
  var averageServicetimeController;
  ///MG1
  var MG1averageInterarrivaltimeController;
  var maxaverageServiceTimeController;
  var minaverageServiceTimeController;
  ///GG1
  var GG1averageInterarrivaltimeController;
  var GG1averageServicetimeController;
  var varianceArrivalControler;
  var varianceServiceController;
  late TabController tabController;
  ///DATAList
dynamic  mm1List=[];
dynamic  mg1List=[];
dynamic  gg1List=[];
  dynamic  resultConstants=["Lamda","Mue","Roh","Lq","Wq","Ws","Ls"];

  @override
  void onInit() {
  tabController = new TabController(length: 3, vsync: this);

  ///MM1
  averageInterarrivaltimeController = new TextEditingController();
  averageServicetimeController = new TextEditingController();
  ///MG1
   MG1averageInterarrivaltimeController=new TextEditingController();
   maxaverageServiceTimeController=new TextEditingController();
   minaverageServiceTimeController= new TextEditingController();
   ///GG1
  varianceArrivalControler= new TextEditingController();
  varianceServiceController= new TextEditingController();
  GG1averageInterarrivaltimeController= new TextEditingController();
  GG1averageServicetimeController= new TextEditingController();
    super.onInit();
  }
///GG1
  GG1(
      {var averageInterarrivalTime,
      var averageServiceTime,
      var variance1,
      var variance2,var flag}){
      var lamda= 1/averageInterarrivalTime;
      var meu= 1/averageServiceTime;
      var roh = lamda/meu;
      var CsSquare= variance1/pow(1/lamda, 2);
      var CaSquare= variance2/pow(1/meu, 2);
      var lq = pow(roh, 2)*(1+CsSquare)*(CaSquare+roh*CsSquare)/2*(roh-1)*(1+pow(roh, 2)*CsSquare);
      Wq(lq, lamda, meu,roh,flag);

  }
///MG1
  MG1(
      {var averageInterarrivalTime,
      var maxaverageServiceTime,
      var minaverageServiceTime,var flag}){


    var lamda= 1/averageInterarrivalTime;
    var meu= (maxaverageServiceTime+minaverageServiceTime)/2;
    meu=1/meu;
    var roh = lamda/meu;
    var sigmaSquare= pow(maxaverageServiceTime-minaverageServiceTime, 2)/12;
    var lq = pow(lamda, 2)*(sigmaSquare)+pow(roh, 2)/(2*(1- roh));
    Wq(lq, lamda, meu,roh,flag);
  }
///MM1
  MM1({var averageInterarrivalTime, var averageServiceTime,var flag}){
    var lamda= 1/averageInterarrivalTime;
    var meu= 1/averageServiceTime;
    var roh = lamda/meu;
    var lq = pow(roh, 2)/(1- roh);
    Wq(lq, lamda, meu,roh,flag);


  }
///WQ
Wq(var lq,var lamda,var meu,var roh,var flag){
  var wq = lq/lamda;
  Ws(wq, meu,lamda,roh,lq,flag);
  
}
///WS
Ws(var wq, var meu,var lamda,var roh,var lq,var flag){
  var ws= wq+(1/meu);
  Ls(ws, lamda,roh,lq,wq,meu,flag);
  
}
///LS
Ls(var ws, var lamda,var roh,var lq,var wq,var meu,var flag){
  var ls= ws*lamda;
  if(flag == "1"){
    mm1List.add(lamda.toDouble());
    mm1List.add(meu.toDouble());
    mm1List.add(roh.toDouble());
    mm1List.add(lq.toDouble());
    mm1List.add(wq.toDouble());
    mm1List.add(ws.toDouble());
    mm1List.add(ls.toDouble());

    print(mm1List);
  }else if(flag=="2"){
    mg1List.add(lamda.toDouble());
    mg1List.add(meu.toDouble());
    mg1List.add(roh.toDouble());
    mg1List.add(lq.toDouble());
    mg1List.add(wq.toDouble());
    mg1List.add(ws.toDouble());
    mg1List.add(ls.toDouble());
    print(mg1List);
  }else if(flag =="3"){
    gg1List.add(lamda.toDouble());
    gg1List.add(meu.toDouble());
    gg1List.add(roh.toDouble());
    gg1List.add(lq.toDouble());
    gg1List.add(wq.toDouble());
    gg1List.add(ws.toDouble());
    gg1List.add(ls.toDouble());
    print(gg1List);
  }

averageInterarrivaltimeController.clear();
averageServicetimeController.clear();
minaverageServiceTimeController.clear();
maxaverageServiceTimeController.clear();
MG1averageInterarrivaltimeController.clear();
varianceArrivalControler.clear();
varianceServiceController.clear();

  
}







}