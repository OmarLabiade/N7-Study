with Ada.Text_IO;           use Ada.Text_IO;
with Ada.Integer_Text_IO;   use Ada.Integer_Text_IO;
with SDA_Exceptions; 		 use SDA_Exceptions;
with Ada.Strings.Unbounded; use Ada.Strings.Unbounded;
with TH;

procedure th_sujet is

   Capacite1 : constant integer := 11;


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


   function Hachage1(Cle : in Unbounded_String ) return Integer is
      begin
         return Length(Cle) mod Capacite1;
      end Hachage1;

   package TH_String_Integer is 
      new TH(Capacite => Capacite1,T_Cle => Unbounded_String, T_Valeur => Integer,Hachage => Hachage1);
   use TH_String_Integer;

   procedure Afficher_Sda_Indice is
      new Afficher_Sda_Indice(Afficher_Cle => Afficher_Cle1, Afficher_Donnee => Afficher_Valeur1);

   Table : T_TH;
begin
      Initialiser(Table);
      Enregistrer (Table, To_Unbounded_String("un"), 1); 
      Enregistrer (Table, To_Unbounded_String("deux"), 2);
      Enregistrer (Table, To_Unbounded_String("trois"), 3);
      Enregistrer (Table, To_Unbounded_String("quatre"), 4);
      Enregistrer (Table, To_Unbounded_String("cinq"), 5);
      Enregistrer (Table, To_Unbounded_String("quatre-vingt-dix-neuf"), 99);
      Enregistrer (Table, To_Unbounded_String("vingt-et-un"), 21);
      for Indice in 1..Capacite1 loop
         Afficher_Sda_Indice(Table, Indice);
         New_Line;
      end loop;
end th_sujet;



