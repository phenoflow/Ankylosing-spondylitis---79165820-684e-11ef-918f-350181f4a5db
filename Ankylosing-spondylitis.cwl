cwlVersion: v1.0
steps:
  read-potential-cases-i2b2:
    run: read-potential-cases-i2b2.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule1
  spondylitis---secondary:
    run: spondylitis---secondary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule2
      potentialCases:
        id: potentialCases
        source: read-potential-cases-i2b2/output
  juvenile-ankylosing-spondylitis---secondary:
    run: juvenile-ankylosing-spondylitis---secondary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule3
      potentialCases:
        id: potentialCases
        source: spondylitis---secondary/output
  occipitoatlantoaxial-ankylosing-spondylitis---secondary:
    run: occipitoatlantoaxial-ankylosing-spondylitis---secondary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule4
      potentialCases:
        id: potentialCases
        source: juvenile-ankylosing-spondylitis---secondary/output
  cervical-ankylosing-spondylitis---secondary:
    run: cervical-ankylosing-spondylitis---secondary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule5
      potentialCases:
        id: potentialCases
        source: occipitoatlantoaxial-ankylosing-spondylitis---secondary/output
  ankylosing-spondylitis-lumbar---secondary:
    run: ankylosing-spondylitis-lumbar---secondary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule6
      potentialCases:
        id: potentialCases
        source: cervical-ankylosing-spondylitis---secondary/output
  multiple-ankylosing-spondylitis---secondary:
    run: multiple-ankylosing-spondylitis---secondary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule7
      potentialCases:
        id: potentialCases
        source: ankylosing-spondylitis-lumbar---secondary/output
  cervicothoracic-ankylosing-spondylitis---secondary:
    run: cervicothoracic-ankylosing-spondylitis---secondary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule8
      potentialCases:
        id: potentialCases
        source: multiple-ankylosing-spondylitis---secondary/output
  lumbosacral-ankylosing-spondylitis---secondary:
    run: lumbosacral-ankylosing-spondylitis---secondary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule9
      potentialCases:
        id: potentialCases
        source: cervicothoracic-ankylosing-spondylitis---secondary/output
  ankylosing-spondylitis-unspecified---secondary:
    run: ankylosing-spondylitis-unspecified---secondary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule10
      potentialCases:
        id: potentialCases
        source: lumbosacral-ankylosing-spondylitis---secondary/output
  ankylosing-spondylitis-lesion---secondary:
    run: ankylosing-spondylitis-lesion---secondary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule11
      potentialCases:
        id: potentialCases
        source: ankylosing-spondylitis-unspecified---secondary/output
  ankylosing-spondylitis-multisystem---secondary:
    run: ankylosing-spondylitis-multisystem---secondary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule12
      potentialCases:
        id: potentialCases
        source: ankylosing-spondylitis-lesion---secondary/output
  ankylosing-spondylitis-deformity---secondary:
    run: ankylosing-spondylitis-deformity---secondary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule13
      potentialCases:
        id: potentialCases
        source: ankylosing-spondylitis-multisystem---secondary/output
  spondyloarthropathy-ankylosing-spondylitis---secondary:
    run: spondyloarthropathy-ankylosing-spondylitis---secondary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule14
      potentialCases:
        id: potentialCases
        source: ankylosing-spondylitis-deformity---secondary/output
  output-cases:
    run: output-cases.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule15
      potentialCases:
        id: potentialCases
        source: spondyloarthropathy-ankylosing-spondylitis---secondary/output
class: Workflow
inputs:
  inputModule1:
    id: inputModule1
    doc: Js implementation unit
    type: File
  inputModule2:
    id: inputModule2
    doc: Python implementation unit
    type: File
  inputModule3:
    id: inputModule3
    doc: Python implementation unit
    type: File
  inputModule4:
    id: inputModule4
    doc: Python implementation unit
    type: File
  inputModule5:
    id: inputModule5
    doc: Python implementation unit
    type: File
  inputModule6:
    id: inputModule6
    doc: Python implementation unit
    type: File
  inputModule7:
    id: inputModule7
    doc: Python implementation unit
    type: File
  inputModule8:
    id: inputModule8
    doc: Python implementation unit
    type: File
  inputModule9:
    id: inputModule9
    doc: Python implementation unit
    type: File
  inputModule10:
    id: inputModule10
    doc: Python implementation unit
    type: File
  inputModule11:
    id: inputModule11
    doc: Python implementation unit
    type: File
  inputModule12:
    id: inputModule12
    doc: Python implementation unit
    type: File
  inputModule13:
    id: inputModule13
    doc: Python implementation unit
    type: File
  inputModule14:
    id: inputModule14
    doc: Python implementation unit
    type: File
  inputModule15:
    id: inputModule15
    doc: Python implementation unit
    type: File
outputs:
  cases:
    id: cases
    type: File
    outputSource: output-cases/output
    outputBinding:
      glob: '*.csv'
requirements:
  SubworkflowFeatureRequirement: {}
