import os

def main():
    # Ensure the folder exists inside the container
    output_path = "/app/downloads"
    os.makedirs(output_path, exist_ok=True)  # Ensure folder exists

    if not os.path.exists(output_path):
        os.makedirs(output_path, exist_ok=True)
        print(f"✅ Created directory: {output_path}")
    else:
        print(f"📂 Directory already exists: {output_path}")

    # Ask for the Spotify playlist URL
    playlist_url = input("Enter Spotify playlist URL: ")
    if not playlist_url.startswith("https://"):
        print("❌ Invalid URL. Please enter a valid Spotify playlist URL.")
        return

    # Run SpotDL and save downloads inside the container
    os.system(f"spotdl {playlist_url} --output {output_path}")

if __name__ == "__main__":
    main()
