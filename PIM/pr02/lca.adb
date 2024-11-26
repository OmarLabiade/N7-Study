with Ada.Text_IO;            use Ada.Text_IO;
with SDA_Exceptions;         use SDA_Exceptions;
with Ada.Unchecked_Deallocation;

package body LCA is

	procedure Free is
		new Ada.Unchecked_Deallocation (Object => T_Cellule, Name => T_LCA);

	function addresse_cle (Sda : in T_LCA ; Cle : in T_Cle) return T_LCA; --declaration en avance pour pouvoir l'utiliser sans problem (la defintion se trouve dans la fin)


	procedure Initialiser(Sda: out T_LCA) is
	begin
		Sda := null;
	end Initialiser;


	procedure Detruire (Sda : in out T_LCA) is
	A_detruire : T_LCA;
	begin
		While Sda /= null loop
			A_detruire := Sda;
			Sda := Sda.all.Suivante;
			Free(A_detruire);
		end loop;
	end Detruire;

	procedure Afficher_Debug (Sda : in T_LCA) is
	Curseur : T_LCA;
	begin
		Curseur := Sda;
		while Curseur /= null loop
			Put("-->[");
			Afficher_Cle(Curseur.all.Cle);
			Put(" :");
			Afficher_Donnee(Curseur.all.Valeur);
			Put("]");
			Curseur := Curseur.all.Suivante;
		end loop;
		Put ("--E");
	end Afficher_Debug;


	function Est_Vide (Sda : T_LCA) return Boolean is
	begin
		return (Sda = null);
	end;


	function Taille (Sda : in T_LCA) return Integer is --recursive
	begin
		if Est_Vide (Sda) then
			return 0;
		else 
			return 1 + Taille (Sda.all.Suivante);
		end if;
	end Taille;


	--enregistrer au debut un couple cle-valeur (si celui ci n'existe pas)
	procedure Enregistrer (Sda : in out T_LCA ; Cle : in T_Cle ; Valeur : in T_Valeur) is 
	Nouvelle : T_LCA; 
	begin
		if Cle_Presente(Sda, Cle) then
			addresse_cle(Sda, Cle).all.Valeur := Valeur;
		else
			Nouvelle := new T_Cellule;
			Nouvelle.all.Cle := Cle;
			Nouvelle.all.Valeur := Valeur;
			Nouvelle.all.Suivante := Sda;
			Sda := Nouvelle;
		end if;
	end Enregistrer;


	function Cle_Presente (Sda : in T_LCA ; Cle : in T_Cle) return Boolean is
	Curseur :T_LCA;
	begin
		Curseur := Sda;
		while Curseur /= null and then Curseur.all.Cle /= Cle loop -- y aura des parcourt initules si on trouve deja notre cle
			Curseur := Curseur.all.Suivante;
		end loop;
		return Curseur /= null;
	end;


	function La_Valeur (Sda : in T_LCA ; Cle : in T_Cle) return T_Valeur is
	begin
		return addresse_cle(Sda,Cle).all.Valeur;
	end La_Valeur;


	procedure Supprimer (Sda : in out T_LCA ; Cle : in T_Cle) is --
	A_detruire : T_LCA;
	begin
		if  Sda = null then 
			raise Cle_Absente_Exception;
		elsif Sda.all.Cle = Cle then
			A_detruire := Sda;
			Sda := Sda.all.Suivante;
			Free(A_detruire);
		else 
			Supprimer (Sda.all.Suivante, Cle);
		end if;
	end Supprimer;


	procedure Pour_Chaque (Sda : in T_LCA) is
	Curseur :T_LCA;
	begin
		Curseur := Sda;
		while Curseur /= null loop
			begin
				Traiter (Curseur.All.Cle,Curseur.All.Valeur);
			exception
         		when others =>
					null;
			end;
			Curseur := curseur.All.suivante;
		end loop;
	end Pour_Chaque;


	--addresse_cle
	--Recherche de l'adresse Sda  d'un cle 
	--erreur Cle_Absente_Exception si le cle n existe pas 
	function addresse_cle (Sda : in T_LCA ; Cle : in T_Cle) return T_LCA is
	Courant :T_LCA;
	begin
		if not Cle_Presente(Sda,cle) then
			raise Cle_Absente_Exception;
		else 
			Courant := Sda;
			while Courant.all.Cle /= Cle loop 
				Courant := Courant.all.Suivante;
			end loop;
		end if;
		return Courant;
	end;


end LCA;
