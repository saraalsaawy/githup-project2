import 'package:flutter_project2/models/plant_model.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class Database {
  final supabase = Supabase.instance.client;

  Future<AuthResponse> signUp({required String email, required String password}) async {
    return await supabase.auth.signUp(email: email, password: password);
  }

  Future<AuthResponse>login({required String email, required String password}) async {
    return await supabase.auth.signInWithPassword(email: email, password: password);
  }

  Future<void>signOut() async{
    return await supabase.auth.signOut();
  }

  String? getCurrentUserEmail(){
    final sesion= supabase.auth.currentSession;
    final user = sesion?.user;
    return user?.email;
  }

  Future <List<PlantModel>> getPlants({required String light, required String water, required String difficulty}) async{
    final data = await supabase.from('plants').select().eq('light', light).eq('water', water).eq('difficulty', difficulty);
    List<PlantModel> plantsList=[];

    for(var element in data){
      PlantModel p1=PlantModel.fromJson(element);
      plantsList.add(p1);
    }
    return plantsList;
  }

  Future <List<PlantModel>> getAllPlants() async{
    final data = await supabase.from('plants').select();
    List<PlantModel> plantsList=[];

    for(var element in data){
      PlantModel p1=PlantModel.fromJson(element);
      plantsList.add(p1);
    }
    return plantsList;
  }
}
