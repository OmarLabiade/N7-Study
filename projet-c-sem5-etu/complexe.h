#ifndef COMPLEX_H
#define COMPLEX_H

// Type utilisateur complexe_t
struct Complexe {
    double Reel;
    double Imag;
};
typedef struct Complexe complexe_t;

// Fonctions reelle et imaginaire
/**
 * reelle
 *
 * Donner la partie reelle d'un nombre complexe.
 * Paramètres:
 *  C             [in] Complexe
 * retourne : partie reelle de C
 * Pré-conditions :  Rien
 * Post-conditions : reelle(C) = C.Reel 
 */ 
double reelle(complexe_t C);

// Fonctions reelle et imaginaire
/**
 * imaginaire
 *
 * Donner la partie imaginaire d'un nombre complexe.
 * Paramètres:
 *  C             [in] Complexe
 * retourne : partie imaginaire de C
 * Pré-conditions :  Rien
 * Post-conditions : imaginaire(C) = C.Imag
 */ 
double imaginaire(complexe_t C);
// Procédures set_reelle, set_imaginaire et init
/**
 * set_reelle
 *
 * Modifier la partie Reelle d'un nombre complexe 
 * Paramètres : 
 *   resultat       [out] Complexe dont on change la composante Relle
 *   R              [in]  partie Reelle
 * Pré-conditions : resultat non null
 * Post-conditions : resultat -> Reel = R
 */ 
void set_reelle(complexe_t* resultat , double R);
/**
 * set_imaginaire
 *
 * Modifier la partie imaginaire d'un nombre complexe 
 * Paramètres : 
 *   resultat       [out] Complexe dont on change la composante Imaginaire
 *   I              [in]  partie Imaginaire
 * Pré-conditions : resultat non null
 * Post-conditions : resultat -> Imag = I
 */ 
void set_imaginaire(complexe_t* resultat,double I);

/**
 * init
 *
 * Modifier la partie reel et imaginaire d'un nombre complexe 
 * 
 * Paramètres : 
 *   resultat       [out] Complexe dont on change les composantes
 *   R              [in]  partie Reelle
 *   I              [in]  partie Imaginaire
 * 
 * Pré-conditions : resultat non null
 * Post-conditions : resultat -> Reel = R et resultat -> Imag = I
 */ 
void init(complexe_t* resultat,double R,double I);

// Procédure copie
/**
 * copie
 * Copie les composantes du complexe donné en second argument dans celles du premier
 * argument
 *
 * Paramètres :
 *   resultat       [out] Complexe dans lequel copier les composantes
 *   autre          [in]  Complexe à copier
 *
 * Pré-conditions : resultat non null
 * Post-conditions : resultat et autre ont les mêmes composantes
 */
void copie(complexe_t* resultat, complexe_t autre);

// Algèbre des nombres complexes
/**
 * conjugue
 * Calcule le conjugué du nombre complexe op et le sotocke dans resultat.
 *
 * Paramètres :
 *   resultat       [out] Résultat de l'opération
 *   op             [in]  Complexe dont on veut le conjugué
 *
 * Pré-conditions : resultat non-null
 * Post-conditions : reelle(*resultat) = reelle(op), complexe(*resultat) = - complexe(op)
 */
void conjugue(complexe_t* resultat, complexe_t op);

/**
 * ajouter
 * Réalise l'addition des deux nombres complexes gauche et droite et stocke le résultat
 * dans resultat.
 *
 * Paramètres :
 *   resultat       [out] Résultat de l'opération
 *   gauche         [in]  Opérande gauche
 *   droite         [in]  Opérande droite
 *
 * Pré-conditions : resultat non-null
 * Post-conditions : *resultat = gauche + droite
 */
void ajouter(complexe_t* resultat, complexe_t gauche, complexe_t droite);

/**
 * soustraire
 * Réalise la soustraction des deux nombres complexes gauche et droite et stocke le résultat
 * dans resultat.
 *
 * Paramètres :
 *   resultat       [out] Résultat de l'opération
 *   gauche         [in]  Opérande gauche
 *   droite         [in]  Opérande droite
 *
 * Pré-conditions : resultat non-null
 * Post-conditions : *resultat = gauche - droite
 */
void soustraire(complexe_t* resultat, complexe_t gauche, complexe_t droite);

/**
 * multiplier
 * Réalise le produit des deux nombres complexes gauche et droite et stocke le résultat
 * dans resultat.
 *
 * Paramètres :
 *   resultat       [out] Résultat de l'opération
 *   gauche         [in]  Opérande gauche
 *   droite         [in]  Opérande droite
 *
 * Pré-conditions : resultat non-null
 * Post-conditions : *resultat = gauche * droite
 */
void multiplier(complexe_t* resultat, complexe_t gauche, complexe_t droite);

/**
 * echelle
 * Calcule la mise à l'échelle d'un nombre complexe avec le nombre réel donné (multiplication
 * de op par le facteur réel facteur).
 *
 * Paramètres :
 *   resultat       [out] Résultat de l'opération
 *   op             [in]  Complexe à mettre à l'échelle
 *   facteur        [in]  Nombre réel à multiplier
 *
 * Pré-conditions : resultat non-null
 * Post-conditions : *resultat = op * facteur
 */
void echelle(complexe_t* resultat, complexe_t op, double facteur);

/**
 * puissance
 * Calcule la puissance entière du complexe donné et stocke le résultat dans resultat.
 *
 * Paramètres :
 *   resultat       [out] Résultat de l'opération
 *   op             [in]  Complexe dont on veut la puissance
 *   exposant       [in]  Exposant de la puissance
 *
 * Pré-conditions : resultat non-null, exposant >= 0
 * Post-conditions : *resultat = op * op * ... * op
 *                                 { n fois }
 */
void puissance(complexe_t* resultat, complexe_t op, int exposant);

// Module et argument
/**
 * module_carre
 * Calculer le module au carré d'un complexe
 * Paramètres :
 *   C            [in]  Complexe 
 * retourne : module au carree de C
 * Pré-conditions :  Rien
 * Post-conditions : module_carre(C) = module carrw de C, module_carre(C)>=0
 */
double module_carre(complexe_t C);


/**
 * module
 * Calculer le module d'un complexe
 * Paramètres :
 *   C            [in]  Complexe 
 * retourne : module de C
 * Pré-conditions :  Rien
 * Post-conditions : module(C) = module de C, module(C)>=0
 */
double module(complexe_t C);
/**
 * argument
 *
 * Calculer l'argument d'un complexe non nul
 * Paramètres:
 *  C             [in] Complexe
 * retourne : Argument de C
 * Pré-conditions :  C non nul
 * Post-conditions : Argument(C) = Argument de C et -pi<Argument(C)<= pi
 */ 
double argument(complexe_t C);


#endif // COMPLEXE_H



