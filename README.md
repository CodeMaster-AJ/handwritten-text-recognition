# Handwritten Text Recognition System using CRNN & CTC Loss

An end-to-end Deep Learning system built in PyTorch that transcribes offline images of handwritten English words into digital text strings. The system uses a Convolutional Recurrent Neural Network (CRNN) paired with Connectionist Temporal Classification (CTC) Loss to recognize text streams without needing separate character segmentation.

## 📊 Project Performance
*   **Backbone Architecture:** CRNN (7 Convolutional Layers + 2 Bidirectional LSTM Layers)
*   **Loss Engine:** PyTorch `nn.CTCLoss` configured for dynamic character spacing
*   **Training Acceleration:** Apple Silicon GPU Hardware Acceleration (`mps`)
*   **Final Training Loss:** Achieved **< 1.00** over deep training iterations

---

## 🏗️ Folder Structure

```text
handwriting_project/
│
├── dataset/                     
│   └── iam_words/
│       ├── words.txt            # Ground-truth annotations (mapped with space isolation)
│       └── words/               # Nested folders containing the raw .png word images
│
├── test_images/                 # Directory holding your own test handwriting images
│   └── my_word.png              # Custom smartphone camera image sample
│
├── saved_models/                
│   └── best_model.pth           # Serialized high-accuracy PyTorch weights state dict
│
├── venv/                        # Isolated local Python execution environment
├── main_project.ipynb           # Complete single-notebook engineering workflow pipeline
└── README.md                    # Core project presentation and documentation
```

---

## ⚙️ How It Works (The Pipeline)

1.  **Data Intake:** Reads the metadata layout file, filtering out broken characters while grouping formatting columns using space-collapse parsing parameters.
2.  **Visual Extraction (CNN):** A VGG-inspired feature network extracts visual curve tokens, patterns, and line intersections.
3.  **Sequence Context (Bi-LSTM):** A 2-layer recurrent network reads horizontal features chronologically forward and backward to decode character patterns in context.
4.  **CTC Transcription Alignment:** The alignment engine condenses repeated character features and discards blank spaces to format smooth digital words.
5.  **Inference Auto-Inversion:** A custom image-processing block automatically checks user image brightness to correct for phone camera shadows before making predictions.

---

## 🚀 Quick Setup Instructions

### 1. Initialize the Virtual Environment
Open your system terminal inside the root project directory and run:
```bash
python3 -m venv venv
source venv/bin/activate
pip install jupyter opencv-python numpy matplotlib torch torchvision
```

### 2. Run the Notebook
Launch VS Code, open `main_project.ipynb`, choose the `venv` kernel in the top right, and click **Run All** to execute the pipeline steps.

### 3. Test on Custom Handwriting
Drop a cropped photo of your handwriting into `test_images/my_word.png` and run the deployment inference block:
```python
print(transcribe_custom_handwriting_fixed('test_images/my_word.png', model, num_to_char))
```
