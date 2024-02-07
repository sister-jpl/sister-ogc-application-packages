cwlVersion: v1.0
$graph:
- class: Workflow
  label: ogc-sister-preprocess
  doc: Preprocess input radiance and ancillary datasets for downstream algorithms
  id: ogc-sister-preprocess
  inputs:
    crid:
      type: string
      label: crid
      doc: ''
      default: '000'
    experimental:
      type: string
      label: experimental
      doc: ''
      default: 'True'
    raw_dataset:
      type: File
      label: raw_dataset
      doc: ''
      default: ''
  outputs:
    output_context:
      type: Directory
      outputSource: process/job_output
  steps:
    process:
      run: '#process'
      in:
        crid: crid
        experimental: experimental
        raw_dataset: raw_dataset
      out: [job_output]
- class: CommandLineTool
  id: process
  requirements:
    DockerRequirement:
      dockerPull: ogc-app-pack-sister-preprocess:3.0.0
  baseCommand: /app/sister-preprocess/pge_run.sh
  arguments: []
  inputs:
    crid:
      type: string
      inputBinding:
        position: 1
        prefix: --crid
    experimental:
      type: string
      inputBinding:
        position: 2
        prefix: --experimental
    raw_dataset:
      type: File
      inputBinding:
        position: 3
        prefix: --raw_dataset
  outputs:
    job_output:
      type: Directory
      outputBinding:
        glob: output*
$namespaces:
  s: https://schema.org/
s:softwareVersion: 3.0.0
schemas:
- http://schema.org/version/9.0/schemaorg-current-http.rdf
