/*
 * Zakładamy, że dane wczytujemy np z pliku JSON (lub każdego innego pliku lecz wtedy możliwe,
 * że po częsci trzeba samemu napisać parser bo nie ma bezpośredniej biblioteki jak GSON)
 * i wykonujemy parsowanie - zamienę kolejnych obiektów z pliku JSON na obiekty w Javie
 * dzieki czemu otrzymujemy kolekcje obiektów klasy Miasto
 */

/**
 * City => Miasto
 * name => nazwa
 * country => kraj
 * province => wojewodztwo
 * citizenNumber => liczba_mieszkancow
 * longitude => dlugosc_geograficzna
 * latitude => szerokość_geograficzna
 */
public class City {

    private String name;
    private String country;
    private String province;
    private Integer citizenNumber;
    private Integer longitude;
    private Integer latitude;

    public City(String name, String country, String province, Integer citizenNumber,
                Integer longitude, Integer latitude) {
        this.name = name;
        this.country = country;
        this.province = province;
        this.citizenNumber = citizenNumber;
        this.longitude = longitude;
        this.latitude = latitude;
    }

    public String getName() {
        return name;
    }

    public String getCountry() {
        return country;
    }

    public String getProvince() {
        return province;
    }

    public Integer getCitizenNumber() {
        return citizenNumber;
    }

    public Integer getLongitude() {
        return longitude;
    }

    public Integer getLatitude() {
        return latitude;
    }
}

/**
 * T - pewien bliżej nieokreslony typ
 */
public class CityMapper {

    @Override
    public void map(T key, T city, T context) {
        city.forEach(it -> {
            if (it.getCitizenNumber() > 100000) {
                context.write(it.getName(), it.getCountry(), it.getProvince(),
                        it.getCitizenNumber());
            }
        });
    }
}

public class CityReducer {

    @Override
    public void reduce(key, values) {
        // Funkcja tożsamościowa tzn nic nie zmienia
    }
}

/*-----------------------------------------------------------------------------------------*/

/**
 * T - pewien bliżej nieokreslony typ
 */
public class CityMapper {

    @Override
    public void map(T key, T city, T context) {
        city.forEach(it -> {
            context.write(it.getCountry(), it.getProvince(), it.getCitizenNumber());
        });
    }
}

public class CityReducer {

    @Override
    public void reduce(T key, List<City> cities, T context) {
        int average = 0;

        cities.forEach(it -> {
            average += it.getCitizenNumber()
        });

        average /= cities.size();
        List cities2 = <City.getCountry(), City.getProvince(), average >;
        context.write(key, cities2)
    }
}

/*-----------------------------------------------------------------------------------------*/

/**
 * T - pewien bliżej nieokreslony typ
 */
public class CityMapper {

    @Override
    public void map(T key, T city, T context) {
        city.forEach(it -> {
            context.write(it.getCountry(), it.getCitizenNumber());
        });
    }
}

public class CityReducer {

    @Override
    public void reduce(T key, List<City> cities, T context) {
        int sum = 0;

        cities.forEach(it -> {
            sum += it.getCitizenNumber();
        });

        List cities2 = <City.getCountry(), sum >;
        context.write(key, cities2)
    }
}
