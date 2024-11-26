with LCA;
generic 
   Capacite : Integer;
   type T_Cle is private;
   type T_Valeur is private;
   function Hachage(Cle : in T_Cle) return Integer;

package TH is

	type T_TH is private;
   
	-- Initialiser les Sda du tableau
	procedure Initialiser(Table : in out T_TH) with
		Post => Est_Vide (Table);

   -- Détruire toutes les Sda  du tableau.
	procedure Detruire (Table : in out T_TH);

   -- est ce que une Sda du Tableau d'Indice I est vide
   function Est_Vide_Indice(Table : in T_TH; Indice : in Integer) return Boolean with
      Post => (Indice <= Capacite);

	-- Est-ce que le tableau contient que des Sda Vide
	function Est_Vide (Table : in T_TH) return Boolean;



	-- Obtenir le nombre d'éléments de la Sda d'un indice choisie du tableau. 
	function Taille (Table : in T_TH ; Indice : in Integer) return Integer with
		Post => (Taille'Result >= 0)
			and ((Taille'Result = 0) = Est_Vide_Indice(Table, Indice))
         and (Indice <= Capacite);


	-- Enregistrer un couple cle,valeur dans la Sda correspondante.
	-- Si la clé est déjà présente dans la Sda, sa valeur est changée.
   procedure Enregistrer (Table : in out T_TH; Cle : in T_Cle ; Valeur : in T_Valeur) with
		Post => Cle_Presente (Table, Cle) and (La_Valeur (Table, Cle) = Valeur)   -- valeur insérée
				and (not (Cle_Presente (Table, Cle)'Old) or Taille (Table, Hachage(Cle)) = Taille (Table, Hachage(Cle))'Old)
				and (Cle_Presente (Table, Cle)'Old or Taille (Table, Hachage(Cle)) = Taille (Table, Hachage(Cle))'Old + 1);


	-- Supprimer la valeur associée à une Clé dans une Sda.
	-- Exception : Cle_Absente_Exception si Clé n'est pas utilisée dans la Sda Correspandante
	procedure Supprimer (Table : in out T_TH; Cle : in T_Cle ) with
		Post =>  (Taille (Table, Hachage(Cle)) = Taille (Table, Hachage(Cle))'Old - 1) -- un élément de moins
			and (not (Cle_Presente (Table, Cle)));         -- la clé a été supprimée


	-- Savoir si une Clé est présente dans une Sda de tableau.
	function Cle_Presente (Table : in T_TH; Cle : in T_Cle) return Boolean;

	-- Obtenir la valeur associée à une Cle dans une Sda du tableau.
	-- Exception : Cle_Absente_Exception si Clé n'est pas utilisée dans l'Sda correspondante
	function La_Valeur (Table : in T_TH; Cle : in T_Cle ) return T_Valeur;

	-- Appliquer un traitement (Traiter) pour chaque couple d'une Sda du tableau.
	generic
		with procedure Traiter (Cle : in T_Cle; Valeur: in T_Valeur);
	procedure Pour_Chaque_Indice (Table : in out T_TH; Indice :in Integer);


	-- Afficher la Sda d'indice choisie.
	generic
		with procedure Afficher_Cle (Cle : in T_Cle);
		with procedure Afficher_Donnee (Valeur : in T_Valeur);
	procedure Afficher_Sda_Indice (Table : in T_TH; Indice :in Integer );


private

   package LCA_TH is
		new LCA (T_Cle => T_Cle, T_Valeur => T_Valeur);

   type T_TH is array(1..Capacite) of LCA_TH.T_LCA;

end TH;