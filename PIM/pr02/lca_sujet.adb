with Ada.Text_IO;           use Ada.Text_IO;
with Ada.Integer_Text_IO;   use Ada.Integer_Text_IO;
with SDA_Exceptions; 		 use SDA_Exceptions;
with Ada.Strings.Unbounded; use Ada.Strings.Unbounded;
with LCA;

procedure lca_sujet is

   function Avec_Guillemets (S: Unbounded_String) return String is
	begin
		return '"' & To_String (S) & '"';
	end;

   procedure Afficher_Cle1 (Cle : in Unbounded_String) is
   begin
      Put (Avec_Guillemets (Cle));
   end Afficher_Cle1 ;

   procedure Afficher_Valeur1 (Valeur : in Integer) is
   begin
      Put(Integer'Image(Valeur));
   end Afficher_Valeur1 ;

   package LCA_String_Integer is
      new LCA (T_Cle => Unbounded_String,T_Valeur => Integer);
   use LCA_String_Integer;

   Procedure Afficher is 
      new Afficher_Debug(Afficher_Cle => Afficher_Cle1, Afficher_Donnee => Afficher_Valeur1);
   Sda : T_LCA;

begin
   Initialiser(Sda);
   Enregistrer(Sda,To_Unbounded_String("deux"), 2); 
   Enregistrer(Sda,To_Unbounded_String("un"), 1);  
   Afficher(Sda);  
   Detruire(Sda);
end lca_sujet;
