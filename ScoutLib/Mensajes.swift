//
//  Mensajes.swift
//  ScoutLib
//
//  Created by Martín Valorzi on 29/09/2021.
//
enum Frase{
    case CODE
    case FIND
    case FIND_TEXT
    case BOOKS
    case MENU
    case LANGUAGE
    case LANGUAGE_NAME
    case THEMES
    case ABOUT
    case ABOUT_DATE
    case ABOUT_AUTHOR
    case ABOUT_VERSION
    case ABOUT_DESCRIPTION
    case HELP
    case HELP_TITLE
    case HELP_P1
    case HELP_P2
    case HELP_P3
    case HELP_P4
    case HELP_P5
    case HELP_P6
    case HELP_IMAGE
    case HELP_VIDEO
    case VIEW
}
enum Idioma{
case EN
case ES
case PT
case FR
case IT
}

class Mensajes{
  public var idioma : Idioma;
  public var text : String;

  init(){
    idioma = Idioma.EN;
    text = "";
  }
  init(idioma: Idioma){
    self.idioma = idioma;
    text = "";
  }
  public func StrToIdioma(_ idioma: String) -> Idioma{
        switch idioma {
        case "es": return Idioma.ES;
        case "en": return Idioma.EN;
        case "pt": return Idioma.PT;
        case "fr": return Idioma.FR;
        case "it": return Idioma.IT;
        default: return Idioma.EN;
        }
    }
    
  public func get(_ frase: Frase) -> String{
     switch idioma{
     case Idioma.ES :
       switch frase{
       case Frase.CODE: return("es");
       case Frase.FIND: return("Buscar");
       case Frase.FIND_TEXT: return("Texto a Buscar (Al menos 3 letras)");
       case Frase.BOOKS: return("Libros");
       case Frase.MENU: return("Menu");
       case Frase.LANGUAGE: return("Idioma: ");
       case Frase.LANGUAGE_NAME: return("Español");
       case Frase.THEMES: return("Temas");
       case Frase.ABOUT: return("Acerca De ...");
       case Frase.ABOUT_DATE: return("Setiembre 2021");
       case Frase.ABOUT_AUTHOR: return("Autor: Martín Valorzi");
       case Frase.ABOUT_VERSION: return("Versión 1.0");
       case Frase.ABOUT_DESCRIPTION: return("Biblioteca de Lectura de Libros Scouts.");
       case Frase.HELP: return("Ayuda");
       case Frase.HELP_TITLE: return("Ayuda de SCOUTLIB");
       case Frase.HELP_P1: return("Libros: ");
       case Frase.HELP_P2: return("Esta opción muestra los temas de la biblioteca.");
       case Frase.HELP_P3: return("Pulsando un tema obtendremos la lista de libros de ese tema elegido.");
       case Frase.HELP_P4: return("Pulsando el libro, este se abrirá en el visor externo.");
       case Frase.HELP_P5: return("Buscar : ");
       case Frase.HELP_P6: return("Devuelve un listado con los libros que coinciden con el texto de búsqueda");
       case Frase.HELP_IMAGE: return("help_es");
       case Frase.HELP_VIDEO: return("https://aspx.com.ar/drive/CompuLibEN.mov");
       case Frase.VIEW: return ("Abrir Libro");
       }
     case Idioma.EN :
       switch frase{
       case Frase.CODE: return("en");
       case Frase.FIND: return("Search");
       case Frase.FIND_TEXT: return("Text to Find (At least 3 letters)");
       case Frase.BOOKS: return("Books");
       case Frase.MENU: return("Menu");
       case Frase.LANGUAGE: return("Language: ");
       case Frase.LANGUAGE_NAME: return("English");
       case Frase.THEMES: return("Topics");
       case Frase.ABOUT: return("About");
       case Frase.ABOUT_DATE: return("September 2021");
       case Frase.ABOUT_AUTHOR: return("Author: Martin Valorzi");
       case Frase.ABOUT_VERSION: return("Version 1.0");
       case Frase.ABOUT_DESCRIPTION: return("");
       case Frase.HELP: return("Help");
       case Frase.HELP_TITLE: return("SCOUTLIB Help.");
       case Frase.HELP_P1: return("Books: ");
       case Frase.HELP_P2: return("This option displays the topics in the library.");
       case Frase.HELP_P3: return("By pressing a topic we will obtain the list of books of that chosen topic.");
       case Frase.HELP_P4: return("By clicking on the book, it will open in the external viewer.");
       case Frase.HELP_P5: return("Search: ");
       case Frase.HELP_P6: return("Returns a list of books that match the search text.");
       case Frase.HELP_IMAGE: return("help_en");
       case Frase.HELP_VIDEO: return("https://aspx.com.ar/drive/CompuLibEN.mov");
       case Frase.VIEW: return ("View");
       }
     
     default: return "";
     

     }
  }
  
    }
