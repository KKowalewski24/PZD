package pl.jkkk.task1;

import org.apache.hadoop.fs.Path;
import org.apache.hadoop.io.IntWritable;
import org.apache.hadoop.io.Text;
import org.apache.hadoop.mapreduce.Job;
import org.apache.hadoop.mapreduce.lib.input.FileInputFormat;
import org.apache.hadoop.mapreduce.lib.output.FileOutputFormat;

public class ProcessLogs {

    /*------------------------ FIELDS REGION ------------------------*/

    /*------------------------ METHODS REGION ------------------------*/
    public static void main(String[] args) throws Exception {
        if (args.length != 2) {
            System.out.printf("Usage: ProcessLogs <input dir> <output dir>\n");
            System.exit(-1);
        }

        Job job = Job.getInstance();
        job.setJarByClass(ProcessLogs.class);
        job.setJobName("Process Logs");

        FileInputFormat.setInputPaths(job, new Path(args[0]));
        FileOutputFormat.setOutputPath(job, new Path(args[1]));

        job.setMapperClass(LogMonthMapper.class);
        job.setReducerClass(CountReducer.class);

        job.setMapOutputKeyClass(Text.class);
        job.setMapOutputValueClass(Text.class);

        job.setOutputKeyClass(Text.class);
        job.setOutputValueClass(IntWritable.class);

        job.setNumReduceTasks(12);
        job.setPartitionerClass(MonthPartitioner.class);

        boolean success = job.waitForCompletion(true);
        System.exit(success ? 0 : 1);
    }
}
    