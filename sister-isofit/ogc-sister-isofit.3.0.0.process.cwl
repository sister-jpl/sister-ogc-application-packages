cwlVersion: v1.0
$graph:
- class: Workflow
  label: ogc-sister-isofit
  doc: The SISTER wrapper for ISOFIT. ISOFIT (Imaging Spectrometer Optimal FITting)
    contains a set of routines and utilities for fitting surface, atmosphere and instrument
    models to imaging spectrometer data.
  id: ogc-sister-isofit
  inputs:
    segmentation_size:
      type: string
      label: segmentation_size
      doc: ''
      default: '50'
    n_cores:
      type: string
      label: n_cores
      doc: ''
      default: '32'
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
    radiance_dataset:
      type: Directory
      label: radiance_dataset
      doc: ''
      default: ''
    location_dataset:
      type: Directory
      label: location_dataset
      doc: ''
      default: ''
    observation_dataset:
      type: Directory
      label: observation_dataset
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
        segmentation_size: segmentation_size
        n_cores: n_cores
        crid: crid
        experimental: experimental
        radiance_dataset: radiance_dataset
        location_dataset: location_dataset
        observation_dataset: observation_dataset
      out: [job_output]
- class: CommandLineTool
  id: process
  requirements:
    DockerRequirement:
      dockerPull: ogc-app-pack-sister-isofit:3.0.0
  baseCommand: /app/sister-isofit/run.sh
  arguments: []
  inputs:
    segmentation_size:
      type: string
      inputBinding:
        position: 1
        prefix: --segmentation_size
    n_cores:
      type: string
      inputBinding:
        position: 2
        prefix: --n_cores
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
    radiance_dataset:
      type: Directory
      inputBinding:
        position: 5
        prefix: --radiance_dataset
    location_dataset:
      type: Directory
      inputBinding:
        position: 6
        prefix: --location_dataset
    observation_dataset:
      type: Directory
      inputBinding:
        position: 7
        prefix: --observation_dataset
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
