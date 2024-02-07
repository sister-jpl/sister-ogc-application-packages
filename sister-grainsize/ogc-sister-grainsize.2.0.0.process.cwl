cwlVersion: v1.0
$graph:
- class: Workflow
  label: ogc-sister-grainsize
  doc: Estimate snow grain size.
  id: ogc-sister-grainsize
  inputs:
    snow_cover:
      type: string
      label: snow_cover
      doc: ''
      default: '0.9'
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
    reflectance_dataset:
      type: Directory
      label: reflectance_dataset
      doc: ''
      default: ''
    frcov_dataset:
      type: Directory
      label: frcov_dataset
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
        snow_cover: snow_cover
        crid: crid
        experimental: experimental
        reflectance_dataset: reflectance_dataset
        frcov_dataset: frcov_dataset
      out: [job_output]
- class: CommandLineTool
  id: process
  requirements:
    DockerRequirement:
      dockerPull: ogc-app-pack-sister-grainsize:2.0.0
  baseCommand: /app/sister-grainsize/pge_run.sh
  arguments: []
  inputs:
    snow_cover:
      type: string
      inputBinding:
        position: 1
        prefix: --snow_cover
    crid:
      type: string
      inputBinding:
        position: 2
        prefix: --crid
    experimental:
      type: string
      inputBinding:
        position: 3
        prefix: --experimental
    reflectance_dataset:
      type: Directory
      inputBinding:
        position: 4
        prefix: --reflectance_dataset
    frcov_dataset:
      type: Directory
      inputBinding:
        position: 5
        prefix: --frcov_dataset
  outputs:
    job_output:
      type: Directory
      outputBinding:
        glob: output*
$namespaces:
  s: https://schema.org/
s:softwareVersion: 2.0.0
schemas:
- http://schema.org/version/9.0/schemaorg-current-http.rdf
