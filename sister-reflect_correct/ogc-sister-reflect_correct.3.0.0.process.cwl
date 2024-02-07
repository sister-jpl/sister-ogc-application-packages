cwlVersion: v1.0
$graph:
- class: Workflow
  label: ogc-sister-reflect_correct
  doc: Apply BRDF, topographic and glint correction algorithms to reflectance data.
  id: ogc-sister-reflect_correct
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
    observation_dataset:
      type: Directory
      label: observation_dataset
      doc: ''
      default: ''
    reflectance_dataset:
      type: Directory
      label: reflectance_dataset
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
        observation_dataset: observation_dataset
        reflectance_dataset: reflectance_dataset
      out: [job_output]
- class: CommandLineTool
  id: process
  requirements:
    DockerRequirement:
      dockerPull: ogc-app-pack-sister-reflect_correct:3.0.0
  baseCommand: /app/sister-reflect_correct/pge_run.sh
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
    observation_dataset:
      type: Directory
      inputBinding:
        position: 3
        prefix: --observation_dataset
    reflectance_dataset:
      type: Directory
      inputBinding:
        position: 4
        prefix: --reflectance_dataset
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
