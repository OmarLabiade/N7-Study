with Ada.Text_IO;           use Ada.Text_IO;
with Ada.Integer_Text_IO;   use Ada.Integer_Text_IO;
with LCA;

package body TH is 

	procedure Initialiser(Table : in out T_TH) is
	begin
      for Indice in 1..Capacite loop
		   LCA_TH.Initialiser(Table(Indice));
      end loop;
	end Initialiser;


	procedure Detruire (Table : in out T_TH) is
	begin
      for Indice in 1..Capacite loop
		   LCA_TH.Detruire(Table(Indice));
      end loop;
	end Detruire;

   function Est_Vide_Indice(Table : in T_TH; Indice : in Integer) return Boolean is
      begin
         return LCA_TH.Est_Vide(Table(Indice));
      end Est_Vide_Indice;


	function Est_Vide (Table : in T_TH) return Boolean is
      Est_Vide : Boolean;
      begin
         for i in 1..Capacite loop
            Est_Vide := Est_Vide and LCA_TH.Est_Vide(Table(Indice));
         end loop;
   end Est_Vide;


	function Taille (Table : in T_TH; Indice : in Integer) return Integer is
      begin 
         return LCA_TH.Taille(Table(Indice));
      end Taille;
   

	procedure Enregistrer (Table : in out T_TH; Cle : in T_Cle ; Valeur : in T_Valeur) is
      begin
         LCA_TH.Enregistrer(Table(Hachage(Cle)), Cle, Valeur);
      end Enregistrer;


   procedure Supprimer (Table : in out T_TH; Cle : in T_Cle) is
      begin 
         LCA_TH.Supprimer(Table(Hachage(Cle)));
      end Supprimer;


   function Cle_Presente (Table : in T_TH; Cle : in T_Cle) return Boolean is
      begin 
         return LCA_TH.Cle_Presente(Table(Hachage(Cle)));
      end Supprimer;
   

   function La_Valeur (Table : in T_TH; Cle : in T_Cle) return T_Valeur is
      begin
         return LCA_TH.La_Valeur(Table(Hachage(Cle)));
      end La_Valeur;


	procedure Pour_Chaque_Indice (Table : in out T_TH; Indice :in Integer) is
      procedure Pout_Chaque_LCA is 
         new LCA_TH.Pour_Chaque(Traiter => Traiter);
      begin
         Pour_Chaque_LCA(Table(Indice));
      end Pour_Chaque_Indice;


	procedure Afficher_Sda_Indice (Table : in out T_TH; Indice :in Integer) is
      procedure Afficher_Debug is 
         new LCA_TH.Afficher_Debug(Afficher_Cle => Afficher_Cle, Afficher_Donnee => Afficher_Donnee );
      begin
         Put(Integer'Image(Indice-1));
         Afficher_Debug(Table(Indice));
      end Afficher_Sda_Indice;


end TH;


         

