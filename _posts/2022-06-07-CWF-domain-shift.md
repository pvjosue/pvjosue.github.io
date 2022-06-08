---
title: "Fast light-field 3D microscopy and domain shift adaptation through optics aware invertible neural networks"
collection: publications
date: 2022-05-07
venue: 'yet to come!' # European Light Microscopy Initiative, Turku Finland'
citation: 'Josué Page Vizcaíno' # European Light Microscopy Initiative, Turku Finland'
#, Zeguan Wang, Panagiotis Symvoulidis, Paolo Favaro, Edward S. Boyden and Tobias Lasser.&quot;.'
---

 <!-- [[PDF]](https://mediatum.ub.tum.de/doc/1522002/file.pdf)  -->
 <!-- [[Code]](https://gitlab.lrz.de/IP/olaf)  -->
 <!-- [[Project Page]](http://cvg.unibe.ch/media/project/page/LFMNet/index.html)  -->

## Abstract

Real-time 3D fluorescence microscopy is crucial for the spatio-temporal analysis of live organisms. Scanning microscopes are usually used for this task due to their high spatial resolution, but at the expense of temporal resolution due to their scanning nature.

The eXtended field-of-view light field microscope (XLFM) is a scan-less and straightforward alternative. The XLFM acquires spatio-angular information in a single camera exposure and, in a subsequent step, infers a 3D volume through a reconstruction algorithm, making it an exciting tool for achieving real-time 3D microscopy.
Unfortunately, traditional reconstruction methods (like deconvolution) require lengthy processing times (~0.022 Hz), hampering the speed advantages of the XLFM. Neural network architectures can overcome the speed constraints at the expense of lacking certainty metrics and distribution analysis, rendering them unsuitable for the biomedical realm.
In this work, we propose a mixture of normalizing flows (also known as invertible neural networks) and the image formation model of the XLFM to perform fast 3D reconstructions of live zebrafish neural activity (5-10 Hz of volumes with size 512x512x90 voxels). Furthermore, the proposed approach allows for exact Likelihood computation, enabling distribution monitoring, followed by out-of-distribution detection and retraining of the system when a novel sample is detected. We evaluate the proposed method on live fluorescent Zebrafish and sparse decomposed images containing only the neural activity of the fish.
