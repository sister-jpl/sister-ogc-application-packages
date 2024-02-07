cwlVersion: v1.0
$graph:
- class: Workflow
  label: ogc-sister-resample
  doc: Spectrally resample reflectance data to SBG-like resolution (10nm).
  id: ogc-sister-resample
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
    reflectance_dataset:
      type: Directory
      label: reflectance_dataset
      doc: ''
      default: ''
    uncertainty_dataset:
      type: Directory
      label: uncertainty_dataset
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
        reflectance_dataset: reflectance_dataset
        uncertainty_dataset: uncertainty_dataset
      out: [job_output]
- class: CommandLineTool
  id: process
  requirements:
    DockerRequirement:
      dockerPull: ogc-app-pack-sister-resample:3.0.0
  baseCommand: /app/sister-resample/pge_run.sh
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
    reflectance_dataset:
      type: Directory
      inputBinding:
        position: 3
        prefix: --reflectance_dataset
    uncertainty_dataset:
      type: Directory
      inputBinding:
        position: 4
        prefix: --uncertainty_dataset
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
