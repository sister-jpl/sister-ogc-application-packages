cwlVersion: v1.0
$graph:
- class: Workflow
  label: ogc-sister-aquatic-pigments-pge
  doc: A SISTER wrapper PGE that executes two underlying algorithms to estimate aquatic
    pigments (phycocyanin and chlorophyll A).
  id: ogc-sister-aquatic-pigments-pge
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
    corrected_reflectance_dataset:
      type: Directory
      label: corrected_reflectance_dataset
      doc: ''
      default: ''
    fractional_cover_dataset:
      type: Directory
      label: fractional_cover_dataset
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
        corrected_reflectance_dataset: corrected_reflectance_dataset
        fractional_cover_dataset: fractional_cover_dataset
      out: [job_output]
- class: CommandLineTool
  id: process
  requirements:
    DockerRequirement:
      dockerPull: ogc-app-pack-sister-aquatic-pigments-pge:2.0.0
  baseCommand: /app/sister-aquatic-pigments-pge/run.sh
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
    corrected_reflectance_dataset:
      type: Directory
      inputBinding:
        position: 3
        prefix: --corrected_reflectance_dataset
    fractional_cover_dataset:
      type: Directory
      inputBinding:
        position: 4
        prefix: --fractional_cover_dataset
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
