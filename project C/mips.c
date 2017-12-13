#include <stdio.h>

int detectShape(double width, double length);
double calculateArea(double width, double length);
double calculatePerimeter(double width, double length);

int main()
{
    double width, length;
    printf("Enter the shape width: ");
    scanf(" %lf", &width);
    if (width <= 0)
    {
        printf("Value error: please enter a valid number!\n");
        return 0;
    }

    printf("Enter the shape length: ");
    scanf(" %lf", &length);
    if (length <= 0)
    {
        printf("Value error: please enter a valid number!\n");
        return 0;

    }

    int type = detectShape(width, length);
    if (!type){
        printf("\nThe shape type is: square");
    }
    else {
        printf("\nThe shape type is: rectangle");
    }


    double perimeter = calculatePerimeter(width, length);
    printf("\nThe perimeter is: %.2lf\n", perimeter);

    double area = calculateArea(width, length);
    printf("The area is: %.2lf\n", area);

    return 0;
}

int detectShape(double width, double length){

    if(width == length){

        return 0;
    }else{

        return 1;
    }

}

double calculateArea(double width, double length){

    return width * length;
}

double calculatePerimeter(double width, double length){

    return 2.0 * (width + length);
}


