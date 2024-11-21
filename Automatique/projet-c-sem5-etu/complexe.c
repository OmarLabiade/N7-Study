#include "complexe.h"
#include <math.h>           // Pour certaines fonctions trigo notamment

// Implantations de reelle et imaginaire
double reelle(complexe_t C){
    return C.Reel;
}
double imaginaire(complexe_t C){
    return C.Imag;
}

// Implantations de set_reelle et set_imaginaire
void set_reelle(complexe_t* resultat, double R){
    resultat -> Reel = R;
    }
void set_imaginaire(complexe_t* resultat, double I){
    resultat-> Imag = I;
    }
void init(complexe_t* resultat, double R, double I){
    resultat -> Reel = R;
    resultat -> Imag = I;
    }
// Implantation de copie
void copie(complexe_t* resultat, complexe_t autre){
    resultat->Reel = autre.Reel;
    resultat->Imag = autre.Imag;
}
// Implantations des fonctions algébriques sur les complexes
void conjugue(complexe_t* resultat, complexe_t op){
    resultat->Reel = op.Reel;
    resultat->Imag = -op.Imag;
}
void ajouter(complexe_t* resultat, complexe_t gauche, complexe_t droite){
    resultat->Reel = gauche.Reel + droite.Reel;
    resultat->Imag = gauche.Imag + droite.Imag;
}
void soustraire(complexe_t* resultat, complexe_t gauche, complexe_t droite){
    resultat->Reel = gauche.Reel - droite.Reel;
    resultat->Imag = gauche.Imag - droite.Imag;
}
void multiplier(complexe_t* resultat, complexe_t gauche, complexe_t droite){
    resultat->Reel = (gauche.Reel * droite.Reel)-(gauche.Imag * droite.Imag);
    resultat->Imag = (gauche.Reel * droite.Imag)+(gauche.Imag * droite.Reel);
}
void echelle(complexe_t* resultat, complexe_t op, double facteur){
    resultat->Reel = facteur * op.Reel;
    resultat->Imag = facteur * op.Imag;
}
void puissance(complexe_t* resultat, complexe_t op, int exposant){
    resultat->Reel = 1.0;
    resultat->Imag = 0.0;
    for (int i = 0 ; i < exposant ; i++){
        multiplier(resultat,*resultat,op);
    }
}

// Implantations du module et de l'argument
double module_carre(complexe_t C){
    return (C.Reel * C.Reel) + (C.Imag * C.Imag);

}
double module(complexe_t C){
    return sqrt(module_carre(C));
}

double argument(complexe_t C){
    double pi = acos(-1);
    if ((C.Reel < 0) && (C.Imag = 0)) {
        return pi;
    } 
    else {
        return 2 * atan(C.Imag / (C.Reel + module(C)));
    }
}



