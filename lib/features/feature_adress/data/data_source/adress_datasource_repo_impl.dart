
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_app/core/constants/constants.dart';
import 'package:firebase_app/core/exceptions/custom_exception.dart';
import 'package:firebase_app/features/feature_adress/data/data_source/adress_datasource_repo.dart';
import 'package:firebase_app/features/feature_adress/data/model/adress_model.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:injectable/injectable.dart';

@LazySingleton(as: AdressDatasourceRepo)
class AdressDatasourceRepoImpl extends AdressDatasourceRepo {

  final FirebaseAuth _firebaseAuth;
  final FirebaseFirestore _firebaseFirestore;

  AdressDatasourceRepoImpl(this._firebaseAuth,this._firebaseFirestore);

  @override
  Future<void> addAdress(AdressModel model) async {
    final user = _firebaseAuth.currentUser;
    if(user == null) throw UserNotFound();
    await _firebaseFirestore.collection(Constants.users).doc(user.uid)
      .collection(Constants.adress).add(model.toJson());
  }

  @override
  Future<List<AdressModel>> getAdress() async {
    final user = _firebaseAuth.currentUser;
    if(user == null) throw UserNotFound();
    final adresses = await _firebaseFirestore.collection(Constants.users)
    .doc(user.uid).collection(Constants.adress).get(GetOptions(source: Source.serverAndCache));
    return adresses.docs.map((document) => AdressModel.fromFirestore(document)).toList();
  }

  @override
  Future<void> deleteAdress(AdressModel model) async {
    final user = _firebaseAuth.currentUser;
    if(user == null) throw UserNotFound();
    await _firebaseFirestore.collection(Constants.users).doc(user.uid)
    .collection(Constants.adress).doc(model.id).delete(); 
  }
}