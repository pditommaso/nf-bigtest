nextflow.enable.dsl = 2

params.files = "s3://rnaseq-nf/data/test"

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