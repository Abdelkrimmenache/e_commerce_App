

import 'package:e_commerce_app/helper/enum.dart';
import 'package:get/get.dart';

class checkOutViewModel extends GetxController {
  Delivery _delivery  = Delivery.standardDelivery  ;  
  Delivery? get delivery => _delivery  ;
   

  void changeVlue (Delivery? value) {
    _delivery = value! ; 
    update() ; 
  }


}