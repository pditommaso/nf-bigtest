nextflow.enable.dsl = 2

params.files = ["s3://rnaseq-nf/data/test/temp_10GB_file.1","s3://rnaseq-nf/data/test/temp_10GB_file.2","s3://rnaseq-nf/data/test/temp_10GB_file.3"]


process ls {
  echo true
  input:
    path '*' 
    """
    ls -lha
    df -h
    """   
}

workflow {
    Channel.fromPath(params.files) | collect | ls
}
