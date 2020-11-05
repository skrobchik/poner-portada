# poner_portada.sh

## Descripción

Script de bash para añadir una portada a trabajos de escuela automaticamente.

Se puede configurar la plantilla `main.tex` para personalizar la portada.

Cuenta con valores configurables para:
- Nombre de alumno
- Universidad
- Facultad
- Nombre de trabajo
- Fecha de entrega

## Instalacion

Se tiene que tener `pdflatex` y `pdftk` instalados en el sistema.

En Ubuntu:
```
sudo apt install pdftk
```

y `pdflatex` viene incluido con casi cualquier distribucion de LaTeX, por ejemplo:
```
sudo apt install texlive-latex-recommended
```

Se puede crear un alias para tener acceso al script con mayor facilidad. Por ejemplo si el repositorio esta clonado en el directorio de inicio del usuario:

```
echo "alias ponerportada=\"/home/\$USER/poner-portada/./poner_portada.sh\"" >> ~/.bashrc
```

## Uso

```
./poner_portada.sh [pdf_entrada] [pdf_salida]
```

Si no se especifica `pdf_entrada` el script lo va preguntar automaticamente. El valor predeterminado de `pdf_salida` es `out.pdf`.

## Personalizacion

Se puede editar el archivo `main.tex` para cambiar el formato de la portada. 

Se pueden poner valores predeterminados para cualquiera de los parametros de la portada en `defaults.sh`