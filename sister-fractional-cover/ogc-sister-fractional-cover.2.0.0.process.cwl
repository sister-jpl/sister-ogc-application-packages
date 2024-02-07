cwlVersion: v1.0
$graph:
- class: Workflow
  label: ogc-sister-fractional-cover
  doc: The SISTER wrapper for SpectralUnmixing, a general, fast, and flexible spectral
    unmixing package.
  id: ogc-sister-fractional-cover
  inputs:
    n_cores:
      type: string
      label: n_cores
      doc: ''
      default: '1'
    refl_scale:
      type: string
      label: refl_scale
      doc: ''
      default: '1.0'
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
  outputs:
    output_context:
      type: Directory
      outputSource: process/job_output
  steps:
    process:
      run: '#process'
      in:
        n_cores: n_cores
        refl_scale: refl_scale
        crid: crid
        experimental: experimental
        reflectance_dataset: reflectance_dataset
      out: [job_output]
- class: CommandLineTool
  id: process
  requirements:
    DockerRequirement:
      dockerPull: ogc-app-pack-sister-fractional-cover:2.0.0
  baseCommand: /app/sister-fractional-cover/run.sh
  arguments: []
  inputs:
    n_cores:
      type: string
      inputBinding:
        position: 1
        prefix: --n_cores
    refl_scale:
      type: string
      inputBinding:
        position: 2
        prefix: --refl_scale
    crid:
      type: string
      inputBinding:
        position: 3
        prefix: --crid
    experimental:
      type: string
      inputBinding:
        position: 4
        prefix: --experimental
    reflectance_dataset:
      type: Directory
      inputBinding:
        position: 5
        prefix: --reflectance_dataset
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
