import { StyleSheet, Image } from "react-native";
import { ThemedText } from "@/components/ThemedText";
import { ThemedView } from "@/components/ThemedView";

export default function FighterProfileScreen({ route }) {
  const { fighter } = route.params; // Assume fighter data is passed as a parameter

  return (
    <ThemedView style={styles.container}>
      <Image source={{ uri: fighter.image }} style={styles.image} />
      <ThemedText type="title">{fighter.name}</ThemedText>
      <ThemedText>Wins: {fighter.wins}</ThemedText>
      <ThemedText>Losses: {fighter.losses}</ThemedText>
      <ThemedText>Draws: {fighter.draws}</ThemedText>
    </ThemedView>
  );
}

const styles = StyleSheet.create({
  container: {
    padding: 20,
  },
  image: {
    width: "100%",
    height: 200,
    borderRadius: 10,
  },
});
