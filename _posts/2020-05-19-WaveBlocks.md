---
title: "Learning to Model and Calibrate Optics via a Differentiable Wave Optics Simulator"
collection: publications
date: 2020-05-19
venue: 'arXiv'
citation: 'J. Page, P. Favaro &quot;Learning to Model and Calibrate Optics via a Differentiable Wave Optics Simulator.&quot; In <i>arXiv</i>.'
---

 [[PDF]](https://cvg.unibe.ch/media/publications/pdf/pagejosue_ICIP_2020_Wave_blocks.pdf) 
 [[Project Page]](https://github.com/pvjosue/WaveBlocks) [[Code]](https://github.com/pvjosue/WaveBlocks) 

## Abstract

We present a novel learning-based method to build a differentiable computational model of a real fluorescence microscope. Our model can be used to calibrate a real optical setup directly from data samples and to engineer point spread functions by specifying the desired input-output data. This approach is poised to drastically improve the design of microscopes, because the parameters of current models of optical setups cannot be easily fit to real data. Inspired by the recent progress in deep learning, our solution is to build a differentiable wave optics simulator as a composition of trainable modules, each computing light wave-front (WF) propagation due to a specific optical element. We call our differentiable modules WaveBlocks and show reconstruction results in the case of lenses, wave propagation in air, camera sensors and diffractive elements (e.g., phase-masks).
