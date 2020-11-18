public class Hello {
    public static void main(String[] args) {
        Person ming = new Person();
        ming.name = "xiaoming";
        ming.age = 12;
        System.out.println("Hello, world!");
    }
}

class Person
{
    protected String name; //protected 可以被子类访问
    protected int age;

    public String getName()
    {
        return this.name;
    }

    public void setName(String name)
    {
        this.name = name;
    }

    public int getAge()
    {
        return this.age;
    }

    public void setAge(int age)
    {
        this.age = age;
    }
}

// class Student extends Person
// {
//     private int ascore;

//     public int getScore()
//     {
//         return this.ascore;
//     }

//     public void setScore(int socre)
//     {
//         this.ascore = score;
//     } 
// }

// 因为interface是一个纯抽象类，所以它不能定义实例字段。但是，interface是可以有静态字段的，并且静态字段必须为final类型：
public interface interfaceDemo {
    public static final int MALE = 1;
    public static final int FEMALE = 2;
}