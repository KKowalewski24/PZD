package pl.jkkk.task3;

import org.apache.hadoop.io.IntWritable;
import org.apache.hadoop.io.LongWritable;
import org.apache.hadoop.io.Text;
import org.apache.hadoop.mapreduce.Mapper;

import java.io.IOException;

public class LogFileMapper extends Mapper<LongWritable, Text, Text, IntWritable> {

    /*------------------------ FIELDS REGION ------------------------*/

    /*------------------------ METHODS REGION ------------------------*/
    @Override
    public void map(LongWritable key, Text value, Context context)
            throws IOException, InterruptedException {
        String line = value.toString();
        String ip = line.substring(0, line.indexOf(" ")).trim();

        if (ip.length() > 0) {
            context.write(new Text(ip), new IntWritable(1));
        }
    }
}
    