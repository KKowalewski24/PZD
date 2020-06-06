package pl.jkkk.task1;

import org.apache.hadoop.io.LongWritable;
import org.apache.hadoop.io.Text;
import org.apache.hadoop.mapreduce.Mapper;

import java.io.IOException;
import java.util.Arrays;
import java.util.List;

public class LogMonthMapper extends Mapper<LongWritable, Text, Text, Text> {

    /*------------------------ FIELDS REGION ------------------------*/
    public static List<String> months = Arrays
            .asList("Jan", "Feb", "Mar", "Apr", "May", "Jun", "Jul",
                    "Aug", "Sep", "Oct", "Nov", "Dec");

    /*------------------------ METHODS REGION ------------------------*/

    @Override
    public void map(LongWritable key, Text value, Context context)
            throws IOException, InterruptedException {
        String[] fields = value.toString().split(" ");

        if (fields.length > 3) {
            String ip = fields[0];

            String[] dtFields = fields[3].split("/");

            if (dtFields.length > 1) {
                String theMonth = dtFields[1];

                if (months.contains(theMonth)) {
                    context.write(new Text(ip), new Text(theMonth));
                }
            }
        }
    }
}
    