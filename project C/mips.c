#include <stdio.h>
#include <stdlib.h>

char *detectShape(double width, double length);
double calculateArea(double width, double length);
double calculatePerimeter(double width, double length);

int main()
{
    double width, length;
	printf("Enter the shape width: ");
    scanf(" %lf", &width);

	printf("Enter the shape length: ");
    scanf(" %lf", &length);

    char *type = detectShape(width, length);

    printf("\nThe shape type is: %s", type);

    double perimeter = calculatePerimeter(width, length);
    printf("\nThe perimeter is: %.2lf\n", perimeter);

    double area = calculateArea(width, length);
    printf("The area is: %.2lf\n", area);

    return 0;
}

char *detectShape(double width, double length){

    if(width == length){

        return "square";
    }else{

        return "rectangle";
    }

}

double calculateArea(double width, double length){

    return width * length;
}

double calculatePerimeter(double width, double length){

    return 2.0 * (width + length);
}


