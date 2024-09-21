﻿<%@ Page Title="" Language="C#" MasterPageFile="~/Home.Master" AutoEventWireup="true" CodeBehind="Review.aspx.cs" Inherits="NewVersion.css.Review" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
<!-- Start Hero Section -->
<div class="hero">
	<div class="container">
		<div class="row justify-content-between">
				<div class="col-lg-5">
					<div class="intro-excerpt">
						<h1>Review</h1>
					</div>
				</div>
				<div class="col-lg-7">
					
				</div>
		</div>
	</div>
</div>
<!-- End Hero Section -->

	<div class="review-container">
        <!-- Product Details -->
        <div class="prod-details">
            <div class="prod-image">
                <asp:Image ID="Image1" runat="server" src="images/z-flip_blue.jpg"  alt="Product Image"/>
            </div>
            <div class="prod-info">
                <h3 class="prod-name">Z-flip 2024</h3>
                <p class="prod-details">Model: 258GB, Color: Navy Blue</p>
            </div>
        </div>

        <!-- Product Quality Rating -->
        <div class="rating-section">
            <h3>Product Quality</h3>
            <div class="rating-stars">
                <i class="fa fa-star" data-value="1"></i>
                <i class="fa fa-star" data-value="2"></i>
                <i class="fa fa-star" data-value="3"></i>
                <i class="fa fa-star" data-value="4"></i>
                <i class="fa fa-star" data-value="5"></i>
            </div>
        </div>

        <br />


       <!-- Media Uploads -->
    <div class="media-upload">
        <!-- Image/Video upload -->
        <input type="file" id="FileUploadMedia" name="FileUploadMedia" class="file-upload-input" accept="image/*,video/*" onchange="previewMedia(event)" multiple />
        <label for="FileUploadMedia" class="upload-btn">
            <asp:Image ID="Image2" runat="server" src="images/camera.png"  alt="Upload Icon" class="upload-icon" />
            Add Photo / Video
        </label>
    
    </div>

    

    <!-- Preview Image -->
    <div id="imagePreview" class="mt-3" style="display: none; width: 200px; height: 150px; overflow: hidden; border: 1px solid #ccc; border-radius: 5px;">
        <asp:Image ID="previewImage" runat="server" style="width: 100%; height: auto;" />
    </div>

    <div id="mediaContainer" style="display: flex; align-items: flex-start;">
        <div id="mediaPreview"></div>
        <div id="addMoreContainer" style="margin-left: 20px;">
            <div id="addMoreBox" style="display: flex; align-items: center; justify-content: center; width: 150px; height: 150px; border: 2px dashed #ccc; border-radius: 10px; cursor: pointer; position: relative;">
                <input type="file" id="mediaInput" multiple accept="image/*,video/*" onchange="previewMedia(event)" style="display: none;">
                <span style="font-size: 48px; color: #ccc;">+</span>
                <span style="position: absolute; bottom: 10px; font-size: 14px; color: #666;">Add more</span>
            </div>
            <div id="errorMessage" style="color: red; display: none;"></div>
        </div>
    </div>


        <!-- Image Modal -->
        <!-- Modal box -->
        <div class="modal fade" id="photoModal" tabindex="-1" role="dialog">
            <div class="modal-dialog" role="document">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title">Edit Photo</h5>
                        <asp:Button ID="btnClose" runat="server" class="close" data-dismiss="modal" aria-label="Close" />
                            <span aria-hidden="true">&times;</span>
                    </div>
                    <div class="modal-body">
                        <!-- Display uploaded photo -->
                        <asp:Image ID="uploadedImage" runat="server" CssClass="img-fluid" />
                
                        <!-- Options for editing the photo -->
                        <div class="mt-3">
                            <asp:Button ID="btnCrop" runat="server" Text="Crop" CssClass="btn btn-secondary" />
                            <asp:Button ID="btnFlip" runat="server" Text="Flip" CssClass="btn btn-secondary" />
                            <asp:Button ID="btnRotate" runat="server" Text="Rotate" CssClass="btn btn-secondary" />
                        </div>
                    </div>
                    <div class="modal-footer">
                        <asp:Button ID="btnApplyChanges" runat="server" Text="OK" CssClass="btn btn-primary" OnClientClick="applyEdits(); return false;" />
                        <asp:Button ID="btnCancelChanges" runat="server" Text="Cancel" class="btn btn-secondary"  data-dismiss="modal"/>
                        <input type="file" id="imageUploadInput" onchange="previewImage(event);" style="display: none;"  />
                    </div>
                </div>
            </div>
        </div>

        <br />
        












        <!-- Description -->
        <div class="description-section">
            <h3>Description</h3>
            <textarea rows="5" placeholder="Write your review here..."></textarea>
        </div>

        <!-- Submit Button -->
        <div class="submit-section"> 
            <asp:Button ID="btnReview" runat="server" class="submit-btn" Text="Submit Review" OnClick="btnReview_Click" />
        </div>
    </div>


<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
    <script>
        document.addEventListener('DOMContentLoaded', function () {
            const ratingStars = document.querySelectorAll('.rating-stars .fa-star');

            ratingStars.forEach(star => {
                star.addEventListener('mouseover', function () {
                    // Light up stars from left to right
                    const ratingValue = this.getAttribute('data-value');
                    ratingStars.forEach(star => {
                        if (star.getAttribute('data-value') <= ratingValue) {
                            star.classList.add('hover');
                        } else {
                            star.classList.remove('hover');
                        }
                    });
                });

                star.addEventListener('mouseout', function () {
                    // Remove hover effect, keep selected stars highlighted
                    const selectedValue = document.querySelector('.rating-stars .fa-star.selected')?.getAttribute('data-value');
                    ratingStars.forEach(star => {
                        if (selectedValue && star.getAttribute('data-value') <= selectedValue) {
                            star.classList.add('selected');
                        } else {
                            star.classList.remove('hover');
                        }
                    });
                });

                star.addEventListener('click', function () {
                    // Set selected rating
                    const ratingValue = this.getAttribute('data-value');
                    ratingStars.forEach(star => {
                        if (star.getAttribute('data-value') <= ratingValue) {
                            star.classList.add('selected');
                        } else {
                            star.classList.remove('selected');
                        }
                    });
                });
            });
        });
    </script>

    <script src="js/Mediareview.js"></script>

    <script>
        let selectedFiles = [];

        function previewMedia(event) {
            let files = event.target.files;
            const mediaPreview = document.getElementById('mediaPreview');
            mediaPreview.innerHTML = ''; // Clear previous previews
            let errorMessage = '';

            if (files.length > 3) {
                document.getElementById('errorMessage').style.display = 'block';
                document.getElementById('errorMessage').textContent = 'You can only upload a maximum of 3 files.';
                return;
            }

            let imageCount = 0;
            let videoCount = 0;

            for (let i = 0; i < files.length; i++) {
                let file = files[i];
                let fileType = file.type;

                // Count images and videos separately
                if (fileType.startsWith('image/')) {
                    imageCount++;
                } else if (fileType.startsWith('video/')) {
                    videoCount++;
                } else {
                    errorMessage = 'Invalid file type. Only images and videos are allowed.';
                    break;
                }

                // Validate combination: max 2 photos, max 1 video
                if (videoCount > 1) {
                    errorMessage = 'You can only upload 1 video.';
                    break;
                }

                if (imageCount > 2) {
                    errorMessage = 'You can upload a maximum of 2 photos.';
                    break;
                }

                // Create a preview container for each file
                let previewContainer = document.createElement('div');
                previewContainer.style.display = 'inline-block';
                previewContainer.style.margin = '5px';
                previewContainer.style.width = '200px';
                previewContainer.style.height = '150px';
                previewContainer.style.overflow = 'hidden';
                previewContainer.style.border = '1px solid #ccc';
                previewContainer.style.borderRadius = '5px';

                let reader = new FileReader();
                reader.onload = function (e) {
                    let mediaElement;
                    if (fileType.startsWith('image/')) {
                        mediaElement = document.createElement('img');
                        mediaElement.src = e.target.result;
                        mediaElement.style.width = '100%';
                        mediaElement.style.height = 'auto';
                    } else if (fileType.startsWith('video/')) {
                        mediaElement = document.createElement('video');
                        mediaElement.src = e.target.result;
                        mediaElement.controls = true;
                        mediaElement.style.width = '100%';
                        mediaElement.style.height = 'auto';
                    }

                    previewContainer.appendChild(mediaElement);
                    mediaPreview.appendChild(previewContainer);
                };

                reader.readAsDataURL(file);
            }

            if (errorMessage) {
                document.getElementById('errorMessage').style.display = 'block';
                document.getElementById('errorMessage').textContent = errorMessage;
            } else {
                document.getElementById('errorMessage').style.display = 'none';
            }
        }

        document.getElementById('addMoreBox').addEventListener('click', function () {
            document.getElementById('mediaInput').click();
        });
    </script>

    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
    <script>
        let editedImageDataUrl = null;

        // Show modal
        function showModal() {
            $('#photoModal').modal('show');
        }

        // Hide modal
        function hideModal() {
            $('#photoModal').modal('hide');
        }
    </script>

    <script>
        function previewMedia(event) {
            var file = event.target.files[0];
            var reader = new FileReader();

            if (file) {
                reader.onload = function (e) {
                    var uploadedImage = document.getElementById('<%= uploadedImage.ClientID %>');
                    const imagePreviewContainer = document.getElementById('imagePreview');

                    if (file.type.startsWith('image/')) {
                    uploadedImage.src = e.target.result; // Set the image source
                    uploadedImage.style.display = 'block';
                    imagePreviewContainer.style.display = 'block'; 
                    imagePreviewContainer.innerHTML = '';
                    imagePreviewContainer.appendChild(uploadedImage.cloneNode());
                    editedImageDataUrl = e.target.result; // Store the image data URL

                    // Show the modal for photo editing
                    $('#photoModal').modal('show');

                } else if (file.type.startsWith('video/')) {
                    // Handle video uploads
                    uploadedImage.src = ''; // Clear image source
                    const videoPreview = document.createElement('video');
                    videoPreview.src = e.target.result; // Set the video source
                    videoPreview.controls = true; // Add controls for video
                    videoPreview.classList.add('img-fluid'); // Optional styling
                    
                    uploadedImage.parentNode.replaceChild(videoPreview, uploadedImage); // Replace image with video

                    // Show the preview container directly
                    const imagePreviewContainer = document.getElementById('imagePreview');
                    imagePreviewContainer.style.display = 'block'; // Show the container
                        imagePreviewContainer.appendChild(videoPreview); // Add video to preview


                }
            };

            reader.readAsDataURL(file);
        } else {
            document.getElementById('errorMessage').style.display = 'block';
            console.log('Please upload a valid image or video file.');
        }
    }

        // Function to apply edits and show the updated image in the preview
        function applyEdits() {
            const uploadedImage = document.getElementById('<%= uploadedImage.ClientID %>');
        const previewImage = document.getElementById('<%= previewImage.ClientID %>');
        const imagePreviewDiv = document.getElementById('imagePreview');

        // Use the current image in the modal (uploadedImage) to set it in the preview box
        previewImage.src = uploadedImage.src;

        // Show the preview div with the updated image
        imagePreviewDiv.style.display = 'block';

        // Close the modal
        $('#photoModal').modal('hide');
    }

        // Event listener for the OK button
        document.addEventListener('DOMContentLoaded', function () {
            const btnApplyChanges = document.getElementById('<%= btnApplyChanges.ClientID %>');
        if (btnApplyChanges) {
            btnApplyChanges.onclick = function (e) {
                    applyEdits();
                    $('#photoModal').modal('hide');
                    e.preventDefault(); // Ensure the default action is prevented
                };
            }
        });

        function previewMedia(event) {
            var file = event.target.files[0];
            var reader = new FileReader();

            if (file) {
                reader.onload = function (e) {
                    var uploadedImage = document.getElementById('<%= uploadedImage.ClientID %>');
                const imagePreviewContainer = document.getElementById('imagePreview');
                    const previewImage = document.getElementById('<%= previewImage.ClientID %>');

                    if (file.type.startsWith('image/')) {
                        uploadedImage.src = e.target.result; // Set the image source
                        uploadedImage.style.display = 'block'; // Show the image in the modal
                        $('#photoModal').modal('show'); // Show the modal for editing

                    } else if (file.type.startsWith('video/')) {
                        uploadedImage.style.display = 'none'; // Hide image
                        const videoPreview = document.createElement('video');
                        videoPreview.src = e.target.result; // Set video source
                        videoPreview.controls = true; // Add video controls
                        videoPreview.classList.add('img-fluid'); // Optional styling

                        // Show the video directly in the preview box
                        const imagePreviewDiv = document.getElementById('imagePreview');
                        imagePreviewDiv.style.display = 'block'; // Show the container
                        imagePreviewDiv.innerHTML = ''; // Clear previous content
                        imagePreviewDiv.appendChild(videoPreview); // Add video to preview
                    }
                };

                reader.readAsDataURL(file);
            }
        }

        btnApplyChanges.onclick = function (e) {
            alert('Button clicked!'); // Test alert
            e.preventDefault();
            applyEdits();
            $('#photoModal').modal('hide');
        };

        // Handle adding more media
        function handleAddMoreMedia() {
            var newInput = document.createElement('input');
            newInput.type = 'file';
            newInput.classList.add('file-upload-input');
            newInput.accept = 'image/*,video/*';
            newInput.onchange = previewMedia;

            // Add the new input to the media upload section
            document.querySelector('.media-upload').appendChild(newInput);
        }
</script>

</asp:Content>
