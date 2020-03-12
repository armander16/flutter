class User {
  String name;
  String user;
  String isf;
  String wm;
  String gerencia;
  String app;
  String rol;
  String tel;
  String email;
  String practica;
 
  User({this.user, this.name, this.isf,this.wm , this.gerencia, this.app, this.rol, this.tel, this.email, this.practica });
 
  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      name:     json["Nombre Colaborador"] as String,
      user:     json["Usuario PPM"] as String,
      isf:      json["IS"] as String,
      wm:       json["Usuario WM"] as String,
      gerencia: json["Gerencia"] as String,
      app:      json["Experiencia Aplicaciones WM"] as String,
      rol:      json["Rol"] as String,
      tel:      json["Teléfono"] as String,
      email:    json["Correo"] as String,
      practica: json["Practica"] as String,

    );
  }
}


