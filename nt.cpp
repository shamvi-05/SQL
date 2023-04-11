/* EULER
 RK METHOD
 BISECTION METHOD
 REGULA FALSI METHOD
 SECANT METHOD
 NEWTON RAPHSON METHOD
 GAUSS ELIMINATION METHOD
 GAUSS JORDAN METHOD
 JACOBI METHOD
 GAUSS SIEDAL METHOD
 POWER METHOD
 LAGRANGE INTERPOLATION
 NEWTON DIVIDED DIFFERENCE







//-----------------------------------------------------------------  (1)
// EULER METHOD

#include<iostream>

/* defining ordinary differential equation to be solved */
/* In this example we are solving dy/dx = x + y */
#define f(x,y) x+y

using namespace std;

int main()
{
 float x0, y0, xn, h, yn, slope;
 int i, n;

 cout<<"Enter Initial Condition"<< endl;
 cout<<"x0 = ";
 cin>> x0;
 cout<<"y0 = ";
 cin >> y0;
 cout<<"Enter calculation point xn = ";
 cin>>xn;
 cout<<"Enter number of steps: ";
 cin>> n;

 /* Calculating step size (h) */
 h = (xn-x0)/n;

 /* Euler's Method */
 cout<<"\nx0\ty0\tslope\tyn\n";
 cout<<"------------------------------\n";

 for(i=0; i < n; i++)
 {
  slope = f(x0, y0);
  yn = y0 + h * slope;
  cout<< x0<<"\t"<< y0<<"\t"<< slope<<"\t"<< yn<< endl;
  y0 = yn;
  x0 = x0+h;
 }

 /* Displaying result */
 cout<<"\nValue of y at x = "<< xn<< " is " << yn;

 return 0;
}

//--------------------------------------------------------------------------  (2)
//RK Method 4 th order
#include<iostream>

/* Defining ordinary differential equation to be solved */
#define f(x,y) (y*y-x*x)/(y*y+x*x)

using namespace std;

#include

/* defining ordinary differential equation to be solved */
#define f(x,y) (y*y-x*x)/(y*y+x*x)

using namespace std;
int main()
{
 float x0, y0, xn, h, yn, k1, k2, k3, k4, k;
 int i, n;

 cout<<"Enter Initial Condition"<< endl;
 cout<<"x0 = ";
 cin>> x0;
 cout<<"y0 = ";
 cin >> y0;
 cout<<"Enter calculation point xn = ";
 cin>>xn;
 cout<<"Enter number of steps: ";
 cin>> n;

 /* Calculating step size (h) */
 h = (xn-x0)/n;

 /* Runge Kutta Method */
 cout<<"\nx0\ty0\tyn\n";
 cout<<"------------------\n";
 for(i=0; i < n; i++)
 {
  k1 = h * (f(x0, y0));
  k2 = h * (f((x0+h/2), (y0+k1/2)));
  k3 = h * (f((x0+h/2), (y0+k2/2)));
  k4 = h * (f((x0+h), (y0+k3)));
  k = (k1+2*k2+2*k3+k4)/6;
  yn = y0 + k;
  cout<< x0<<"\t"<< y0<<"\t"<< yn<< endl;
  x0 = x0+h;
  y0 = yn;
 }

 /* Displaying result */
 cout<<"\nValue of y at x = "<< xn<< " is " << yn;

 return 0;
}
//-------------------------------------------------------------------------- (3)
// BISECTION METHOD


#include<bits/stdc++.h>
using namespace std;


double func(double x)
{
	return x*x*x - 5*x + 1;
}


void bisection(double a, double b)
{
	if (func(a) * func(b) >= 0)
	{
		cout << "You have not assumed right a and b\n";
		return;
	}

	double c = a;
	cout<<"enter the number of iteration you want:";
	int no;
	int i=0;
	cin>>no;
	while (i<no)
	{

		c = (a+b)/2;


		if (func(c) == 0.0)
			break;


		else if (func(c)*func(a) < 0)
			b = c;
		else
			a = c;

	i++;
	}
	cout << "The value of root is : " << c;
}


int main()
{

	double a =0, b = 1;
	bisection(a, b);
	return 0;
}

//--------------------------------------------------------------------------  (4)
//REGULA FALSI METHOD


#include<bits/stdc++.h>
using namespace std;



double func(double x)
{
	return cos(x) - x*exp(x);
}


void regulaFalsi(double a, double b)
{
	if (func(a) * func(b) >= 0)
	{
		cout << "You have not assumed right a and b\n";
		return;
	}

	double c = a;
	cout<<"enter the numberof iterations :";
	int no;
	cin>>no;

	for (int i=0; i < no; i++)
	{

		c = (a*func(b) - b*func(a))/ (func(b) - func(a));


		if (func(c)==0)
			break;


		else if (func(c)*func(a) < 0)
			b = c;
		else
			a = c;
	}
	cout << "The value of root is : " << c;
}


int main()
{
	double a =0, b = 1;
	regulaFalsi(a, b);
	return 0;
}


//--------------------------------------------------------------------------  (5)
// SECANT METHOD


#include <bits/stdc++.h>
using namespace std;

float f(float x)
{

	float f = cos(x) -x*exp(x);
	return f;
}

void secant(float x1, float x2)
{
	float n = 0, xm, x0, c;
	cout<<"enter the number of iterations:";
	int no,i=0;
	cin>>no;
	if (f(x1) * f(x2) < 0) {
		do {

			x0 = (x1 * f(x2) - x2 * f(x1)) / (f(x2) - f(x1));


			c = f(x1) * f(x0);


			x1 = x2;
			x2 = x0;


			n++;


			if (c == 0)
				break;

		} while (i<no);

		cout << "Root of the given equation=" << x0 << endl;
		cout << "No. of iterations = " << n << endl;
	} else
		cout << "Can not find a root in the given interval";
}


int main()
{
	
	float x1 = 0, x2 = 1;
	secant(x1, x2);
	return 0;
}

//------------------------------------------------------------------------------ (6)

// NEWTON RAPHSON METHOD



#include<bits/stdc++.h>
#define EPSILON 0.0001
using namespace std;


double func(double x)
{
	return cos(x) - x*exp(x);
}


double derivFunc(double x)
{
	return -sin(x)-x*exp(x)-exp(x);
}


void newtonRaphson(double x)
{
	double h = func(x) / derivFunc(x);
	while (abs(h) >= EPSILON)
	{
		h = func(x)/derivFunc(x);

		x = x - h;     //for multiplicity  x = x - m*h; where m is muliplicity

	}

	cout << "The value of the root is : " << x;
}


int main()
{
	double x0 = 1;
	newtonRaphson(x0);
	return 0;
}


//------------------------------------------------------------------------------  (7)

// GAUSS ELIMINATION METHOD


#include<iostream>
#include<iomanip>
#include<math.h>
#include<stdlib.h>

#define   SIZE   10

using namespace std;

int main()
{
	 float a[SIZE][SIZE], x[SIZE], ratio;
	 int i,j,k,n;


     cout<< setprecision(3)<< fixed;


	 cout<<"Enter number of unknowns: ";
	 cin>>n;


	 cout<<"Enter Coefficients of Augmented Matrix: "<< endl;
	 for(i=1;i<=n;i++)
	 {
		  for(j=1;j<=n+1;j++)
		  {
			   cout<<"a["<< i<<"]"<< j<<"]= ";
			   cin>>a[i][j];
		  }
	 }

	 for(i=1;i<=n-1;i++)
	 {
		  if(a[i][i] == 0.0)
		  {
			   cout<<"Mathematical Error!";
			   exit(0);
		  }
		  for(j=i+1;j<=n;j++)
		  {
			   ratio = a[j][i]/a[i][i];

			   for(k=1;k<=n+1;k++)
			   {
			  		a[j][k] = a[j][k] - ratio*a[i][k];
			   }
		  }
	 }

	 x[n] = a[n][n+1]/a[n][n];

	 for(i=n-1;i>=1;i--)
	 {
		  x[i] = a[i][n+1];
		  for(j=i+1;j<=n;j++)
		  {
		  		x[i] = x[i] - a[i][j]*x[j];
		  }
		  x[i] = x[i]/a[i][i];
	 }


	 cout<< endl<<"Solution: "<< endl;
	 for(i=1;i<=n;i++)
	 {
	  	cout<<"x["<< i<<"] = "<< x[i]<< endl;
	 }

	 return(0);
}


//------------------------------------------------------------------------------ (8)
// GAUSS JORDAN METHOD



#include<iostream>
#include<iomanip>
#include<math.h>
#include<stdlib.h>

#define SIZE 10

using namespace std;

int main()
{
		 float a[SIZE][SIZE], x[SIZE], ratio;
		 int i,j,k,n;

         cout<< setprecision(3)<< fixed;


		 cout<<"Enter order of matrix: ";
		 cin>>n;

		 /* 2. Reading Matrix */
		 cout<<"Enter coefficients of Matrix: " << endl;
		 for(i=1;i<=n;i++)
		 {
			  for(j=1;j<=n;j++)
			  {
				   cout<<"a["<< i<<"]"<< j<<"]= ";
                   cin>>a[i][j];
			  }
		 }


		 for(i=1;i<=n;i++)
		 {
			  for(j=1;j<=n;j++)
			  {
				   if(i==j)
				   {
				    	a[i][j+n] = 1;
				   }
				   else
				   {
				    	a[i][j+n] = 0;
				   }
			  }
		 }


		 for(i=1;i<=n;i++)
		 {
			  if(a[i][i] == 0.0)
			  {
				   cout<<"Mathematical Error!";
				   exit(0);
			  }
			  for(j=1;j<=n;j++)
			  {
				   if(i!=j)
				   {
					    ratio = a[j][i]/a[i][i];
					    for(k=1;k<=2*n;k++)
					    {
					     	a[j][k] = a[j][k] - ratio*a[i][k];
					    }
				   }
			  }
		 }

		 for(i=1;i<=n;i++)
		 {
			  for(j=n+1;j<=2*n;j++)
			  {
			   	a[i][j] = a[i][j]/a[i][i];
			  }
		 }

		 cout<< endl<<"Inverse Matrix is:"<< endl;
		 for(i=1;i<=n;i++)
		 {
			  for(j=n+1;j<=2*n;j++)
			  {
			   	cout<< a[i][j]<<"\t";
			  }
			  cout<< endl;
		 }
		 return(0);
}


//----------------------------------------------------------------------------- (9)
//JACOBI METHOD


#include<iostream>
#include<iomanip>
#include<math.h>

#define f1(x,y,z)  (17-y+2*z)/20
#define f2(x,y,z)  (-18-3*x+z)/20
#define f3(x,y,z)  (25-2*x+3*y)/20

using namespace std;


int main()
{
 float x0=0, y0=0, z0=0, x1, y1, z1, e1, e2, e3, e;
 int step=1;


 cout<< setprecision(6)<< fixed;


 cout<<"Enter tolerable error: ";
 cin>>e;

 cout<< endl<<"Count\tx\t\ty\t\tz"<< endl;
 do
 {
  /* Calculation */
  x1 = f1(x0,y0,z0);
  y1 = f2(x0,y0,z0);
  z1 = f3(x0,y0,z0);
  cout<< step<<"\t"<< x1<<"\t"<< y1<<"\t"<< z1<< endl;

  /* Error */
  e1 = fabs(x0-x1);
  e2 = fabs(y0-y1);
  e3 = fabs(z0-z1);

  step++;

  /* Set value for next iteration */
  x0 = x1;
  y0 = y1;
  z0 = z1;
 }while(e1>e && e2>e && e3>e);

 cout<< endl<<"Solution: x = "<< x1<<", y = "<< y1<<" and z = "<< z1;
 return 0;
}


//----------------------------------------------------------------------------- (10)

//GAUSS SIEDAL METHOD


#include<iostream>
#include<iomanip>
#include<math.h>



#define f1(x,y,z)  (17-y+2*z)/20
#define f2(x,y,z)  (-18-3*x+z)/20
#define f3(x,y,z)  (25-2*x+3*y)/20

using namespace std;


int main()
{
 float x0=0, y0=0, z0=0, x1, y1, z1, e1, e2, e3, e;
 int step=1;


 cout<< setprecision(6)<< fixed;


 cout<<"Enter tolerable error: ";
 cin>>e;

 cout<< endl<<"Count\tx\t\ty\t\tz"<< endl;

 do
 {
  x1 = f1(x0,y0,z0);
  y1 = f2(x1,y0,z0);
  z1 = f3(x1,y1,z0);

  cout<< step<<"\t"<< x1<<"\t"<< y1<<"\t"<< z1<< endl;


  e1 = fabs(x0-x1);
  e2 = fabs(y0-y1);
  e3 = fabs(z0-z1);

  step++;


  x0 = x1;
  y0 = y1;
  z0 = z1;

 }while(e1>e && e2>e && e3>e);

 cout<< endl<<"Solution: x = "<< x1<<", y = "<< y1<<" and z = "<< z1;
 return 0;
}


//--------------------------------------------------------------------------------  (11)
//POWER METHOD

#include<iostream>
#include<iomanip>
#include<stdio.h>
#include<math.h>

#define SIZE 10

using namespace std;

int main()
{
	 float a[SIZE][SIZE], x[SIZE],x_new[SIZE];
	 float temp, lambda_new, lambda_old, error;
	 int i,j,n, step=1;


     cout<< setprecision(3)<< fixed;


	 cout<<"Enter Order of Matrix: ";
	 cin>>n;


	 cout<<"Enter Tolerable Error: ";
	 cin>>error;


	 cout<<"Enter Coefficient of Matrix: "<< endl;
	 for(i=1;i<=n;i++)
	 {
		  for(j=1;j<=n;j++)
		  {
			   cout<<"a["<< i<<"]"<< j<<"]= ";
               cin>>a[i][j];
		  }
	 }

	 cout<<"Enter Initial Guess Vector: "<< endl;
	 for(i=1;i<=n;i++)
	 {
		  cout<<"x["<< i<<"]= ";
		  cin>>x[i];
	 }


	 lambda_old = 1;

	 up:
	 for(i=1;i<=n;i++)
	 {
		  temp = 0.0;
		  for(j=1;j<=n;j++)
		  {
		   	temp = temp + a[i][j]*x[j];
		  }
		  x_new[i] = temp;
	 }


	 for(i=1;i<=n;i++)
	 {
	  	x[i] = x_new[i];
	 }


	 lambda_new = fabs(x[1]);
	 for(i=2;i<=n;i++)
	 {
		  if(fabs(x[i])>lambda_new)
		  {
		   	lambda_new = fabs(x[i]);
		  }
	 }


	 for(i=1;i<=n;i++)
	 {
	  	x[i] = x[i]/lambda_new;
	 }

	 cout<< endl<< endl<<"STEP-"<< step<< endl;
	 cout<<"Eigen Value = "<< lambda_new<< endl;
	 cout<<"Eigen Vector: "<< endl;
	 cout<<"[";
	 for(i=1;i<=n;i++)
	 {
	  	cout<< x[i]<<"\t";
	 }
     cout<<"\b\b\b]";


	 if(fabs(lambda_new-lambda_old)>error)
	 {
		  lambda_old=lambda_new;
		  step++;
		  goto up;
	 }

	 return(0);
}

//-----------------------------------------------------------------------------  (12)
//LAGRANGE INTERPOLATION


#include<iostream>
#include<conio.h>

using namespace std;

int main()
{
	 float x[100], y[100], xp, yp=0, p;
	 int i,j,n;

	 /* Input Section */
	 cout<<"Enter number of data: ";
	 cin>>n;
	 cout<<"Enter data:"<< endl;
	 for(i=1;i<=n;i++)
	 {
		  cout<<"x["<< i<<"] = ";
		  cin>>x[i];
		  cout<<"y["<< i<<"] = ";
		  cin>>y[i];
	 }
	 cout<<"Enter interpolation point: ";
	 cin>>xp;

	 /* Implementing Lagrange Interpolation */
	 for(i=1;i<=n;i++)
	 {
		  p=1;
		  for(j=1;j<=n;j++)
		  {
			   if(i!=j)
			   {
			    	p = p* (xp - x[j])/(x[i] - x[j]);
			   }
		  }
		  yp = yp + p * y[i];
	 }
	 cout<< endl<<"Interpolated value at "<< xp<< " is "<< yp;

	 return 0;
}


//----------------------------------------------------------------------------- (13)
//NEWTON DIVIDED DIFFERENCE


#include <bits/stdc++.h>
using namespace std;


float proterm(int i, float value, float x[])
{
    float pro = 1;
    for (int j = 0; j < i; j++) {
        pro = pro * (value - x[j]);
    }
    return pro;
}


void dividedDiffTable(float x[], float y[][10], int n)
{
    for (int i = 1; i < n; i++) {
        for (int j = 0; j < n - i; j++) {
            y[j][i] = (y[j][i - 1] - y[j + 1]
                         [i - 1]) / (x[j] - x[i + j]);
        }
    }
}


float applyFormula(float value, float x[],
                   float y[][10], int n)
{
    float sum = y[0][0];

    for (int i = 1; i < n; i++) {
      sum = sum + (proterm(i, value, x) * y[0][i]);
    }
    return sum;
}


void printDiffTable(float y[][10],int n)
{
    for (int i = 0; i < n; i++) {
        for (int j = 0; j < n - i; j++) {
            cout << setprecision(4) <<
                                 y[i][j] << "\t ";
        }
        cout << "\n";
    }
}


int main()
{

    int n ;
    char ans='n';
    cout<<"enter the value for n"<<endl;
    cin>>n;
    float value, sum, y[10][10],x[10];
    cout<<"enter  values of x"<<endl;
    for(int i =0;i<n;i++)
    {
        cin>>x[i];
    }
     cout<<"enter  values of f(x)"<<endl;
     for(int i =0;i<n;i++)
    {
          cin>>y[i][0];
    }


    dividedDiffTable(x, y, n);


    printDiffTable(y,n);

    do
    {


    cout<<"enter the value for which polynomial needed"<<endl;
    cin>>value;


    cout << "\nValue at " << value << " is "
               << applyFormula(value, x, y, n) << endl;
    cout << "Do you want to continue (Y/N)?\n";
    cout << "You must type a 'Y' or an 'N' :";
    cin >> ans;
    }while((ans == 'Y') || (ans == 'y'));
    return 0;
}
