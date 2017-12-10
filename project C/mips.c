#include <stdio.h>
#include <stdlib.h>

char *detectShape(double a, double b, double c, double d);
double calculateArea(double a, double b);
double calculatePerimeter(double a, double b);

int main()
{
	printf("Enter the four sides of the shape: ");
    double a, b, c, d;
    scanf(" %lf %lf %lf %lf", &a, &b, &c, &d);

    char *type = detectShape(a, b, c, d);

    printf("\nThe type is: %s", type);

    double perimeter = calculatePerimeter(a,b);
    printf("\nThe perimeter is: %.2lf\n", perimeter);

    double area = calculateArea(a,b);
    printf("The area is: %.2lf\n", area);

    return 0;
}

char *detectShape(double a, double b, double c, double d){

    if(a == b && b == c && c ==d){

        return "square";
    }else{

        return "rectangle";
    }

}

double calculateArea(double a, double b){

    return a * b;
}

double calculatePerimeter(double a, double b){

    return 2.0 * (a + b);
}


