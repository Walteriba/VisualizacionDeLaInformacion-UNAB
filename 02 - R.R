# Esto es un comentario

# Las variables tienen reglas para nombrarse
# con que tengan nombres "normales" ya esta bien
# Y son case-sensitive (NOMBRE es distinta a nombre)

# Tipos

# numeric - 10.5, 5, 105787
# integer - 1L, 55L, 100L (Con una L mayuscula despues del numero)
# complex - 9 + 3i
# character (string) - ("nombre", "Somos tecnicos en programacion", "Ciencia de Datos", "11.5 no es TRUE")
# logical (boleanos) - (TRUE o FALSE)

# Tambien tenemos inexistente (NA) y nulo (NULL)
# números
a <- 5
b <- 12.5
c <-  a + b

print(c)

# operaciones
resta <- b - a
multiplicacion <- a * b
division <- b / a
division_entera <- b %% a
potencia <- a ^ 2
raiz <- sqrt(b)

print(division)
print(division_entera)

# caracteres
texto <- "El resultado es : " 

# para saber su longitud
longitud <- nchar(texto)
print(longitud)

# Para extraer un caracter o un subconjunto del string
#substr(variable, indice, longitud)
print(substr(texto,1,1))

# para concatenar resultados
print(paste(texto, potencia))

# para no tener espacios
print(paste0(texto, potencia))
# formateo de strings
# %i integers
# %f numeric
# %g "comodin"
# %s char
salida <- sprintf("%g es el resultdo de sumar %g por %g", c, a, b)
print(salida)

# coercion (forzar un tipo) OJO
print(a)
numero_a <- as.character(a)
print(numero_a)

# Verificar tipo
class(numero_a)

# operaciones relacionales
print(5<4)
print(5<=4)
print(5>4)
print(5>=4)
print(5==4)
print(5!=4)
# Funciona con character
print("caza">"casa")

# Operaciones lógicas
# | "o"
# & "y"
# ! NEGACION

# Factores
# son un tipo de datos en los que un tipo cualquiera (generalmente un character) es 
# representado por una etiqueta numerica
# Es lo mismo que decir que lunes es 1, martes es 2, etc, et
# Sirve para representar datos categoricos ordinales con numeros
# lo vamos a ver en graficos

# Vectores
# Vectores de longitud 1
is.vector(a)
# Vectores de caracteres
is.vector(texto)
# creacion de vectores funcion c() (combinar)
vector <- c(2,6,8,2,9,10,5,6,3)
nombres <- c("Abril", "Ariel", "Rocio", "Alexis", "Maite")
edades <- c(25, 30, 30, 24, 20)
# se pueden combinar
combinado <- c(vector,edades)
# vectores de secuencias
secuencia1 <- 1:10

#Operaciones vectoriales
# matematicas
crecieron <- edades + 1
# logicas
responsables <- edades > 21

# Acceder a elementos individuales
print(nombres[3])

# Obtener un subconjunto (slicing, mas o menos...)
print(vector[1:3])
print(vector[c(6, 2)])


# Matrices (no se usan mucho)
matriz <- matrix(1:12, nrow = 3, ncol = 4)
# tambien se pueden crear uniendo vectores 
# cbind() Cada vector como una columna
# rbind() Cada vextor como fila
# Tambien tienen sus operaciones matematicas y logicas
# Para acceder a un elemento individual
print(matriz[2,2])

# Dataframes
# Como las matrices pero hetereogeneas en relacion a las columnas
# muy parecido el concepto a el de tablas de bases de datos

# se pueden formar concatenando vectores
personas <- data.frame(
  "nombres" = nombres,
  "edades" = edades,
  "mas_de_21" = responsables
)
personas

# Para conocer sus dimensiones
dim(personas) # como matriz
length(personas) # cuantas columnas
names(personas) # nombres de las columnas

# se puede crear un dataframe a partir de una matriz
df <- as.data.frame(matriz)
df
names(df)

# Podemos operar matematicamente (da advertencias y no siempre funciona)
# Subconjuntos
personas[2]
personas[c(3,1)]
personas[2,] # solo la fila
personas[,3] # solo la columna
personas[1:2,3] # los valores 1 y 2 de la 3ra columna
personas[1,1:2] # de la fila 1 los valores de la primera y segunda columna

# Tambien podemos usar los nombres de las columnas
personas["edades"] # devuelve otro dataframe
personas[c("edades", "mas_de_21")]
personas$nombres # devuelve un vector...
personas[["mas_de_21"]] # Tambien un vector

# Podemos usar condiciones
personas$edades > 24 # vector de booleanos

personas[personas$edades > 24,] # noten la coma despues del condicional, asi devuelve las filas completas

# Con R vienen algunos grandes dataframes para practicar
# iris son medidas de unas especies de flores
library(datasets)
library(dplyr)
data("iris")
iris

#listas (son como diccionarios en python)
mi_lista <- list("numeros"=1:10, "letras"=c("a","b","c","d","e","f","g","h","j","i"))

# Parametros de una lista
length(mi_lista) # Cuantos elementos tiene
dim(mi_lista) # devuelve NULL
# para aplicar funciones a la lista debemos usar la familia de funciones apply()

# Funciones
nombre <- function(argumentos) {
  operaciones
}
# Area de un triangulo
area_tri <- function(base, altura){
  base * altura /2
}
area1 <- area_tri(5, 4)
print(area1)

# podemos usar argumento nominados
area2 <- area_tri( altura= 4, base= 6)
print(area2)

# Estructuras de control
# if-else
if(condición) {
  operaciones_si_la_condición_es_TRUE
}

if(condición) {
  operaciones_si_la_condición_es_TRUE
} else {
  operaciones_si_la_condición_es_FALSE
}

# Hagamos una funcion con if-else
promedio <- function(calificaciones) {
  media <- mean(calificaciones)
  
  if(media >= 6) {
    print("Aprobado")
  } else {
    print("Desaprobado")
  }
}

promedio(vector)

# ciclo for
for(elemento in objeto) {
  operacion_con_elemento
}

for(nombre in personas$nombres){
  print(nombre)
}

# nos animamos a hacer un programa que dice si el nombre empieza con A?
for(nombre in personas$nombres){
  if (substr(nombre,1,1) =="A"){
    print(sprintf("El nombre %s empieza con la letra A", nombre))
  }
}

# Ciclos while
while(condicion) {
  operaciones
}

# instruccion BREAK para no tener ciclos infinitos
numero <- 20

while(numero > 5) {
  if(numero == 15) {
    break
  }
  numero <- numero - 1
}

# instruccion CONTINUE para saltarse ciclos
for(i in 1:4) {
  if(i == 3) {
    next
  }
  print(i)
}

# Data sets
# Archivos separados por comas o tipo tabla excel
# Se leen con
read.table(file = archivo, header = TRUE, sep = ",", col.names = c("col1", "col2"))
# que los carga en un dataframe
# consultar con ?read.table
titanic <- read.table(file = "titanic.csv", sep = ",", header = TRUE)
head(titanic)
# En esta caso (CSV) es mejor usar la opcion especifica
titanic <- read.csv("titanic.csv")
# Si lo que queremos leer es un archivo excel
# Tenemos que usar la libreria readxl
library(readxl)
# Y los leemos con
data_frame <- read_excel("archivo.xlsx")
# se puede importar de una hoja por vez
# para conocer las hojas del documento
excel_sheets("archivo.xlsx")
# Y para leerlo
data_frame <- read_excel("archivo.xlsx", sheet = "Hoja 1")
# Hay mas opciones para por ejemplo leer solo un rango de celdas
# O ponerle nombres a las columnas

##################################################################################
# Graficas
# Vamos a usar unos datos bancarios de Portugal

banco <- read.csv(file = "bank.csv", sep = ";") # tiene semicolon como separador
# Vemos un poco de los datos 
head(banco)
# sus dimensiones
dim(banco)
# y un resumen de los datos
summary(banco)

# Funcion plot()
# es el equivalente a matplotlib en python
# modo histograma
hist(x=banco$age)
# Lo mejoramos un poco
hist(x=banco$age, main = "Histograma de edades", xlab = "Edad", ylab = "Frecuencia", col = "blue")

# modo barras
plot(x = as.factor(banco$education))
# lo podemos mejorar
plot(x = as.factor(banco$education), main = "Gráfica de Educacíón",
     xlab = "Nivel educativo", ylab = "Frecuencia", 
     col = c("royalblue", "seagreen", "purple", "grey"))

# modo graficas de dispersion
plot(x = banco$age, y = banco$balance)

# modo boxplot
# cuando tenemos algun dato categorico se pasa automaticamente a este modo
plot(x = as.factor(banco$education), y = banco$age)
# lo mejoramos
plot(x = as.factor(banco$education), y = banco$age, main = "Edad por nivel educativo", 
     xlab = "Nivel educativo", ylab = "Edad", 
     col = c("orange3", "yellow3", "green3", "grey"))

# modo mosaico
# Cuando ambos ejes son variables categoricas
plot(x = as.factor(banco$marital), y = as.factor(banco$education), 
     col = c("#99cc99", "#cc9999", "#9999cc", "#9c9c9c"))


####################################################################################################
