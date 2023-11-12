---
title: "Fast light-field 3D microscopy with out-of-distribution detection and adaptation through Conditional Normalizing Flows"
collection: publications
date: 2023-06-14
venue: 'arXiv' # European Light Microscopy Initiative, Turku Finland'
citation: 'Page Vizcaíno, J. et. al. Fast light-field 3D microscopy with out-of-distribution detection and adaptation through Conditional Normalizing Flows, arXiv.2306.06408, 14 June 2023&quot;.'
---
[[PDF]](https://arxiv.org/pdf/2306.06408.pdf)
[[Code]](https://github.com/pvjosue/CWFA)
[[Project Page]](https://github.com/pvjosue/CWFA)

## Abstract
Real-time 3D fluorescence microscopy is crucial for the spatiotemporal analysis of live organisms, such as neural activity monitoring. The eXtended field-of-view light field microscope (XLFM), also known as Fourier light field microscope, is a straightforward, single snapshot solution to achieve this. The XLFM acquires spatial-angular information in a single camera exposure. In a subsequent step, a 3D volume can be algorithmically reconstructed, making it exceptionally well-suited for real-time 3D acquisition and potential analysis. Unfortunately, traditional reconstruction methods (like deconvolution) require lengthy processing times (0.0220 Hz), hampering the speed advantages of the XLFM. Neural network architectures can overcome the speed constraints at the expense of lacking certainty metrics, which renders them untrustworthy for the biomedical realm. This work proposes a novel architecture to perform fast 3D reconstructions of live immobilized zebrafish neural activity based on a conditional normalizing flow. It reconstructs volumes at 8 Hz spanning 512x512x96 voxels, and it can be trained in under two hours due to the small dataset requirements (10 image-volume pairs). Furthermore, normalizing flows allow for exact Likelihood computation, enabling distribution monitoring, followed by out-of-distribution detection and retraining of the system when a novel sample is detected. We evaluate the proposed method on a cross-validation approach involving multiple in-distribution samples (genetically identical zebrafish) and various out-of-distribution ones.
