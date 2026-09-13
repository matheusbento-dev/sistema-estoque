// lib/models/enums/status_ocorrencia.dart
//
// Enum com os status possíveis de uma ocorrência de divergência de
// inventário (RF-INV-02) e de um ajuste pendente de autorização
// (RF-AJU-01/02).
//
// Valores que este enum irá conter:
//   pendente, autorizado, rejeitado.
//
// Regra de negócio associada (RF-INV-02): uma ocorrência de divergência
// deve nascer sempre como `pendente` e não pode gerar ajuste automático de
// quantidade — a mudança de status para `autorizado` só pode ocorrer via
// lib/services/ajuste_service.dart, por um usuário com perfil
// administrador.
//
// Usado por lib/models/inventario_item.dart e lib/models/ajuste.dart.
