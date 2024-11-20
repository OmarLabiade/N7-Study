// This file is part of mandelbrot.
// 
// mandelbrot is free software: you can redistribute it and/or modify it under 
// the terms of the GNU General Public License as published by the Free Software 
// Foundation, either version 3 of the License, or (at your option) any later 
// version.
// 
// mandelbrot is distributed in the hope that it will be useful, but WITHOUT ANY 
// WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS FOR 
// A PARTICULAR PURPOSE. See the GNU General Public License for more details.
// 
// You should have received a copy of the GNU General Public License along with 
// mandelbrot. If not, see <https://www.gnu.org/licenses/>.
//
// mandelbrot - Copyright (c) 2023 Guillaume Dupont
// Contact: <guillaume.dupont@toulouse-inp.fr>
#include "mandelbrot.h"

int mandelbrot(complexe_t z0, complexe_t c, double seuil, int maxit) {
    int nombre_iterations = 0;
    complexe_t z_n = z0;
    while (( module(z_n) <= seuil ) && ( nombre_iterations <= maxit )){
        puissance(&z_n, z_n, 2);
        ajouter(&z_n, z_n, c);
        nombre_iterations ++;
    }
    return nombre_iterations;
}




