import { Image, StyleSheet, Platform, Button } from "react-native";

import ParallaxScrollView from "@/components/ParallaxScrollView";
import { ThemedText } from "@/components/ThemedText";
import { ThemedView } from "@/components/ThemedView";

export default function HomeScreen() {
  return (
    <ParallaxScrollView
      headerImage={
        <Image
          source={{ uri: "https://placehold.co/500" }}
          style={styles.headerImage}
        />
      }
      headerBackgroundColor={{ light: "#A1CEDC", dark: "#1D3D47" }}
    >
      <ThemedView style={styles.titleContainer}>
        <ThemedText type="title">FightPicks</ThemedText>
        <Button
          title="Join a League"
          onPress={() => {
            /* Navigate to League Screen */
          }}
        />
      </ThemedView>
      {/* Upcoming Fights Section */}
      <ThemedView style={styles.upcomingFights}>
        <ThemedText type="subtitle">Upcoming Fights</ThemedText>
        {/* Map through upcoming fights data */}
      </ThemedView>
    </ParallaxScrollView>
  );
}

const styles = StyleSheet.create({
  titleContainer: {
    flexDirection: "row",
    alignItems: "center",
    gap: 8,
  },
  stepContainer: {
    gap: 8,
    marginBottom: 8,
  },
  reactLogo: {
    height: 178,
    width: 290,
    bottom: 0,
    left: 0,
    position: "absolute",
  },
  headerImage: {
    width: "100%",
    height: 200,
  },
  upcomingFights: {
    marginTop: 20,
  },
});
