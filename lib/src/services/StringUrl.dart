String sanitizeString(String input) {
  // Reemplaza caracteres acentuados con sus equivalentes no acentuados
  input = input.replaceAll('á', 'a');
  input = input.replaceAll('é', 'e');
  input = input.replaceAll('í', 'i');
  input = input.replaceAll('ó', 'o');
  input = input.replaceAll('ú', 'u');
  input = input.replaceAll('ñ', 'n');
  
  // Reemplaza espacios con guiones
  input = input.replaceAll(' ', '-');
  
  // Elimina otros caracteres especiales o no deseados
  input = input.replaceAll(RegExp(r'[^a-zA-Z0-9-]'), '');

  return input;
}