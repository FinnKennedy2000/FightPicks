import { StyleSheet, FlatList, Button } from "react-native";
import { ThemedText } from "@/components/ThemedText";
import { ThemedView } from "@/components/ThemedView";

const leagues = [
  { id: "1", name: "Champions League" },
  { id: "2", name: "Ultimate Fighters" },
  // Add more leagues as needed
];

export default function LeagueScreen() {
  return (
    <ThemedView style={styles.container}>
      <ThemedText type="title">Leagues</ThemedText>
      <FlatList
        data={leagues}
        renderItem={({ item }) => (
          <ThemedView style={styles.leagueItem}>
            <ThemedText>{item.name}</ThemedText>
            <Button
              title="Join"
              onPress={() => {
                /* Join league logic */
              }}
            />
          </ThemedView>
        )}
        keyExtractor={(item) => item.id}
      />
    </ThemedView>
  );
}

const styles = StyleSheet.create({
  container: {
    padding: 20,
  },
  leagueItem: {
    flexDirection: "row",
    justifyContent: "space-between",
    padding: 10,
    borderBottomWidth: 1,
  },
});
